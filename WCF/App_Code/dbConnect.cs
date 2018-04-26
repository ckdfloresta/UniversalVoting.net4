using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Reflection;
using System.Data;
using System.Data.SqlClient;

public class dbConnect
{
    #region Database Configurations

    private string dataSource = "LAPTOP-R5JG92K6\\SQLEXPRESS";
    private string initialCatalog = "FakeJudge";
    private string userID = "sa";
    private string password = "123";

    //----Windows Authentication----
    //Comment this line if NOT Windows Authentication
    //private bool integratedSecurity = true;


    //----SQL Authentication----
    //Comment this line if NOT SQL Authentication 
    private bool integratedSecurity = false;

    #endregion

    #region Attributes

    private SqlConnection sqlCon = null;
    private SqlConnectionStringBuilder sqlConString = null;
    private SqlCommand sqlCmd;
    private SqlDataAdapter sqlAdpt;
    private DataTable data;
    private bool hasError;
    private string error;

    public DataTable Data
    {
        get { return data; }
        private set { data = value; }
    }

    public bool HasError
    {
        get { return hasError; }
        private set { hasError = value; }
    }

    public string Error
    {
        get { return error; }
        private set { error = value; }
    }

    #endregion

    #region Constructors

    /// <summary>
    /// Database Initialization
    /// </summary>
    public dbConnect()
    {
        this.Process();
    }

    #endregion

    #region Dispose

    /// <summary>
    /// To close database connection
    /// </summary>
    public void Dispose()
    {
        this.ConnectionClose();
    }

    #endregion
                                                         
    #region Process

    /// <summary>
    /// Check database connection
    /// </summary>
    public void Process()
    {
        this.ConnectionOpen();
        this.ConnectionClose();
    }

    /// <summary>
    /// Executes a Query
    /// </summary>
    /// <param name="command"></param>
    public void ExecuteCommand(string query)
    {
        try
        {
            ConnectionOpen();
            using (sqlCmd = new SqlCommand(query, sqlCon))
            using (sqlAdpt = new SqlDataAdapter(sqlCmd))
            {
                data = new DataTable("Table");
                sqlAdpt.Fill(data);
            }
            ConnectionClose();
            this.HasError = false;
        }
        catch (Exception ex)
        {
            this.HasError = true;
            Error = "Unable to Execute Command!!\n\nError: " + ex.Message;
        }
    }

    /// <summary>
    /// Executes Stored Procedures
    /// </summary>
    /// <param name="command"></param>
    public void ExecuteStoredProc(string query, params object[] args)
    {
        try
        {
            ConnectionOpen();
            using (sqlCmd = new SqlCommand(query, sqlCon))
            using (sqlAdpt = new SqlDataAdapter(sqlCmd))
            {
                //Set Command Type to Stored Proc
                sqlCmd.CommandType = CommandType.StoredProcedure;

                //Construct Parameters
                for (int i = 0; i < args.Length; i++)
                {
                    if (args[i] is string)
                    {
                        SqlParameter sqlparam = new SqlParameter();
                        sqlparam.ParameterName = (string)args[i];
                        sqlparam.Value = args[++i];
                        sqlCmd.Parameters.Add(sqlparam);
                    }
                    else if (args[i] is SqlParameter)
                    {
                        sqlCmd.Parameters.Add((SqlParameter)args[i]);
                    }
                    else
                    {
                        throw new ArgumentException("Unknown sql parameter type");
                    }
                }

                //Insert data
                data = new DataTable("Table");
                sqlAdpt.Fill(data);
            }
            ConnectionClose();
            this.HasError = false;
        }
        catch (Exception ex)
        {
            this.HasError = true;
            Error = "Unable to Execute Stored Procedure!!\n\nError: " + ex.Message;
        }
    }

    #endregion

    #region Connection

    /// <summary>
    /// Open SQL Connection
    /// </summary>
    private void ConnectionOpen()
    {
        this.sqlCon = new SqlConnection();

        try
        {
            this.sqlConString = new SqlConnectionStringBuilder();
            this.sqlConString.DataSource = this.dataSource;
            this.sqlConString.InitialCatalog = this.initialCatalog;
            this.sqlConString.IntegratedSecurity = this.integratedSecurity;

            if (this.integratedSecurity == false)
            {
                this.sqlConString.UserID = this.userID;
                this.sqlConString.Password = this.password;
            }

            this.sqlCon.ConnectionString = this.sqlConString.ConnectionString;
            this.sqlCon.Open();
            this.HasError = false;
        }
        catch (Exception ex)
        {
            this.HasError = true;
            Error = "Unable to connect database!!\n\nError: " + ex.Message;
        }
    }

    /// <summary>
    /// Close SQL Connection
    /// </summary>
    private void ConnectionClose()
    {
        if (this.sqlCon != null)
        {
            if (this.sqlCon.State == ConnectionState.Open)
            {
                this.sqlCon.Close();
            }

            this.sqlCon.Dispose();
            this.sqlCon = null;
        }
    }

    #endregion
}

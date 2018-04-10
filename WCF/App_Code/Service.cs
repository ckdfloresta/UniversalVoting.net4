using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;
using System.Data;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    dbConnect databaseCon = new dbConnect();
    public bool hasError = true;
    public string error = "Nothing was accessed";
    public bool HasError()
    {
        return hasError;
    }

    public string Error()
    {
        return error;
    }

    public void KFspAddConNum(string fname, string lname, int eventID, int connum)
    {
        databaseCon.ExecuteStoredProc("KFspAddConNum","@fname", fname, "@lname", lname, "@_eventid", eventID, "@connum", connum);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void KFspAddExistingPersontoContestant(string fname, string lname, int eventID)
    {
        databaseCon.ExecuteStoredProc("KFspAddExistingPersontoContestant", "@fname", fname, "@lname", lname, "@_eventid", eventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void KFspAddPersonToContestant(string fname, string lname, int eventID)
    {
        databaseCon.ExecuteStoredProc("KFspAddPersonToContestant", "@fname", fname, "@lname", lname, "@_eventid", eventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public DataTable KFspCheckConExistance(string fname, string lname, int eventID)
    {
        databaseCon.ExecuteStoredProc("KFspCheckConExistance", "@fname", fname, "@lname", lname, "@_eventid", eventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return databaseCon.Data;
    }
    public DataTable KFspCheckconnameavailability(string fname, string lname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckconnameavailability", "@fname", fname, "@lname", lname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return databaseCon.Data;
    }
    public DataTable KFspCheckEventAccount(string epname, string euname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventAccount", "@epname", epname, "@euname", euname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return databaseCon.Data;
    }
    public DataTable KFspCheckEventName(string ename)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventName", "@ename", ename);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return databaseCon.Data;
    }
    public DataTable KFspCheckEventPerson(string efname, string elname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventPerson", "@efname", efname, "@elname", elname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return databaseCon.Data;
    }
    public void KFspCreateEvent(string efname, string elname, string epname, string ename, string euname)
    {
        databaseCon.ExecuteStoredProc("KFspCreateEvent", "@efname", efname, "@elname", elname, "@epname", epname, "@ename", ename, "@euname", euname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void KFspFinalizeEvent(string eventid)
    {
        databaseCon.ExecuteStoredProc("KFspFinalizeEvent", "@eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void KFspPopulateScores(string confname, string conlname, string judgefname, string judgelname, string judgeuname, string judgepass, int eventid, string critname)
    {
        databaseCon.ExecuteStoredProc("KFspPopulateScores", "@confname", confname, "@conlname", conlname, "@judgefname", judgefname, "@judgelname", judgelname, "@judgeuname", judgeuname, "@judgepass", judgepass, "@eventid", eventid, "@critname", critname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
}

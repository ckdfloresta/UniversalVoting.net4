using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using System.ServiceModel.Channels;
using System.ServiceModel.Web;
// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{

    dbConnect databaseCon = new dbConnect();
    DataTable _eventorganizers;
    DataTable _events;
    DataTable _judges;
    DataTable resultaccount;

    public bool hasError = true;
    public string error = "Nothing was accessed";

    public bool HasError()
    {
        return hasError;
    }

    public string IsConnected()
    {
        return "Connected";
    }

    public string Error()
    {
        return error;
    }

    public string DTSerializer(DataTable Data)
    {
        string DTString = JsonConvert.SerializeObject(Data);
        return DTString;
    }

    #region DB STORED PROCS
    public void KFspAddConNum(string fname, string lname, int eventID, int connum)
    {
        databaseCon.ExecuteStoredProc("KFspAddConNum", "@fname", fname, "@lname", lname, "@_eventid", eventID, "@connum", connum);
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
    public string KFspCheckConExistance(string fname, string lname, int eventID)
    {
        databaseCon.ExecuteStoredProc("KFspCheckConExistance", "@fname", fname, "@lname", lname, "@_eventid", eventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string KFspCheckconnameavailability(string fname, string lname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckconnameavailability", "@fname", fname, "@lname", lname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string KFspCheckEventAccount(string epname, string euname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventAccount", "@epname", epname, "@euname", euname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string KFspCheckEventName(string ename)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventName", "@ename", ename);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string KFspCheckEventPerson(string efname, string elname)
    {
        databaseCon.ExecuteStoredProc("KFspCheckEventPerson", "@efname", efname, "@elname", elname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
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
    public void KFspRemoveContsestantFromEvent(string fname, string lname, string eventid)
    {
        databaseCon.ExecuteStoredProc("KFspRemoveContsestantFromEvent", "@fname", fname, "@lname", lname, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void KFspUpdateContestant(string fname, string lname, int perid)
    {
        databaseCon.ExecuteStoredProc("KFspUpdateContestant", "@fname", fname, "@lname", lname, "@perid", perid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public string KFspViewEventContestants(int eventid)
    {
        databaseCon.ExecuteStoredProc("KFspViewEventContestants", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string KFspViewNotEventContestants(int eventid)
    {
        databaseCon.ExecuteStoredProc("KFspViewNotEventContestants", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspGetEventCriteriaID(string Name, int EventJudgeID)
    {
        databaseCon.ExecuteStoredProc("MCspGetEventCriteriaID", "@Name", Name, "@EventJudgeID");
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public void MCspUpdateScore(int EventJudgeID, int ContestantID, int EventCriteriaID, int Score)
    {
        databaseCon.ExecuteStoredProc("MCspUpdateScore", "@EventJudgeID", EventJudgeID, "@ContestantID", ContestantID, "@EventCriteriaID", EventCriteriaID, "@Score", Score);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
      
    }
    public string MCspViewContestant(int ContestantID)
    {
        databaseCon.ExecuteStoredProc("MCspViewContestant", "@ContestantID", ContestantID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewContestants(string EventName)
    {
        databaseCon.ExecuteStoredProc("MCspViewContestants", "@EventName", EventName);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewContestantsEvent(int EventID)
    {
        databaseCon.ExecuteStoredProc("MCspViewContestantsEvent", "@EventID", EventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewCriteria(int EventJudgeID)
    {
        databaseCon.ExecuteStoredProc("MCspViewCriteria", "@EventJudgeID", EventJudgeID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewJudgeEvent(string EventName, int JID)
    {
        databaseCon.ExecuteStoredProc("MCspViewJudgeEvent", "@EventName", EventName, "@JID", JID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewJudges(int JudgeID)
    {
        databaseCon.ExecuteStoredProc("MCspViewJudges", "@JudgeID", JudgeID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewOfficialResults(int EventID)
    {
        databaseCon.ExecuteStoredProc("MCspViewOfficialResults", "@EventID", EventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewScore(int EventJudgeID, int ContestantID, int EventCriteriaID)
    {
        databaseCon.ExecuteStoredProc("MCspViewScore", "@EventJudgeID", EventJudgeID, "@ContestantID", ContestantID, "@EventCriteriaID", EventCriteriaID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewScoreWeight(int ContestantID, int EventJudgeID)
    {
        databaseCon.ExecuteStoredProc("MCspViewScoreWeight", "@ContestantID", ContestantID, "@EventJudgeID", EventJudgeID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string MCspViewStatus(string EventName, int JudgeID, int ContestantID)
    {
        databaseCon.ExecuteStoredProc("MCspViewStatus", "@EventName", EventName, "@JudgeID", JudgeID, "@ContestantID", ContestantID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public void spAddCriteriaToEventCriteria(string cname, int weight, int eventid)
    {
        databaseCon.ExecuteStoredProc("spAddCriteriaToEventCriteria", "@cname", cname, "@weight", weight, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spAddJudgeToEventJudges(string fname, string lname, string uname, string pass, int eventid)
    {
        databaseCon.ExecuteStoredProc("spAddJudgeToEventJudges", "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass, "@eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spAddOldCriteriaToEventCriteria(string cname, int weight, int eventid)
    {
        databaseCon.ExecuteStoredProc("spAddOldCriteriaToEventCriteria", "@cname", cname, "@weight", weight, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spAddPersonToEventJudges(string fname, string lname, string uname, string pass, int eventid)
    {
        databaseCon.ExecuteStoredProc("spAddPersonToEventJudges", "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public string spCheckCExistance(string cname, int eventid)
    {
        databaseCon.ExecuteStoredProc("spCheckCExistance", "@cname", cname, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spCheckcnameavailability(string cname)
    {
        databaseCon.ExecuteStoredProc("spCheckcnameavailability", "@cname", cname);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spCheckPersonExistanceinEvent(string fname, string lname, string uname, string pass, int eventid)
    {
        databaseCon.ExecuteStoredProc("spCheckPersonExistanceinEvent", "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass, "@eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spCheckUnameavailability(string judgechars)
    {
        databaseCon.ExecuteStoredProc("spCheckUnameavailability", "@judgechars", judgechars);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public void spRemoveCriteriaFromEventCriteria(string cname, int eventid)
    {
        databaseCon.ExecuteStoredProc("spRemoveCriteriaFromEventCriteria", "@cname", cname, "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spRemoveJudgefromEventJudges(string fname, string lname, string uname, string pass, string eventid)
    {
        databaseCon.ExecuteStoredProc("spRemoveJudgefromEventJudges", "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass, "@eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spUpdateEventCriteria(string cname, int weight, int eventid, int critid)
    {
        databaseCon.ExecuteStoredProc("spUpdateEventCriteria", "@cname", cname, "@weight", weight, "@_eventid", eventid, "@critid", critid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public void spUpdatePersonJudgeDetails(int personid, string fname, string lname, string uname, string pass, int eventid)
    {
        databaseCon.ExecuteStoredProc("spUpdatePersonJudgeDetails", "@personid", personid, "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass, "@eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
    }
    public string spViewEventCriteria(int eventid)
    {
        databaseCon.ExecuteStoredProc("spViewEventCriteria", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spViewEventJudges(int eventid)
    {
        databaseCon.ExecuteStoredProc("spViewEventJudges", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spViewNotEventCriteria(int eventid)
    {
        databaseCon.ExecuteStoredProc("spViewNotEventCriteria", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    public string spViewNotEventJudges(int eventid)
    {
        databaseCon.ExecuteStoredProc("spViewNotEventJudges", "@_eventid", eventid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }
    #endregion
    #region dotnet4 functions
    public string index_login_OnClick(string uname, string pass)
    {
        bool isjudge = false;
        bool iseo = false;
        databaseCon = new dbConnect();
        _judges = new DataTable();
        _eventorganizers = new DataTable();
        resultaccount = new DataTable();

        databaseCon.ExecuteCommand("Select * from Judge");
        if (databaseCon.Data.Rows.Count > 0)
        {
            _judges = databaseCon.Data;
        }

        foreach (DataRow j in _judges.Rows)
        {
            if (uname == j.Field<string>(2).ToString() && pass == j.Field<string>(3).ToString())
            {
                resultaccount = _judges.Clone();
                resultaccount.ImportRow(j);
                resultaccount.Columns.Add("accounttype");
                resultaccount.Rows[0][resultaccount.Columns.Count - 1] = "1";
                isjudge = true;
            }
        }

        if (!isjudge)
        {
            databaseCon.ExecuteCommand("Select * from Eventorganizer");
            if (databaseCon.Data.Rows.Count > 0)
            {
                _eventorganizers = databaseCon.Data;
                foreach (DataRow o in _eventorganizers.Rows)
                {
                    if (uname == o.Field<string>(1).ToString() && pass == o.Field<string>(2).ToString())
                    {
                        isjudge = true;
                        resultaccount = _eventorganizers.Clone();
                        resultaccount.ImportRow(o);
                        databaseCon.ExecuteCommand("SELECT E.IsFinalize FROM EVENT AS E INNER JOIN EVENTORGANIZER AS EO ON EO.EventID = E.EventID WHERE EO.adminUname = N'" + o.Field<string>(1).ToString() + "'");

                        if (!databaseCon.Data.Rows[0].Field<bool>(0))
                        //event is not yet finalized, can proceed to eventwindow
                        {
                            resultaccount.Columns.Add("accounttype");
                            resultaccount.Rows[0][resultaccount.Columns.Count - 1] = "2";
                        }
                        else
                        //event is finalized, cannot proceed to event window
                        {
                            resultaccount.Columns.Add("accounttype");
                            resultaccount.Rows[0][resultaccount.Columns.Count - 1] = "3";
                        }
                    }
                }
            }
        }
        if (!iseo && !isjudge)
        {
            resultaccount.Columns.Add("accounttype");
            resultaccount.Rows.Add("4");
        }

        // 1 judge 2 eo 3 eo finalized 4 not avail

        return DTSerializer(resultaccount);

    }

    public string spViewJudgeUsingJudgeID(int JudgeID)
    {
        databaseCon.ExecuteStoredProc("spViewJudgeUsingJudgeID", "@JudgeID", JudgeID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);
    }

    public string home_eventselect_change(string EventID)
    {

        databaseCon.ExecuteStoredProc("MCspViewContestants", "@EventID", EventID);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;

        return DTSerializer(databaseCon.Data);
    }

    public string home_get_eventjudgeid(string EventID, string judgeid)
    {
        databaseCon.ExecuteStoredProc("[spgetEventjudgeID]", "@EventID", EventID, "@judgeid", judgeid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);

    }

    public string home_get_criteriawithscore(string ejid, string conid)
    {

        databaseCon.ExecuteStoredProc("[spViewCriteriaWithScore]", "@EventJudgeID", ejid, "@ConID", conid);
        hasError = databaseCon.HasError;
        error = databaseCon.Error;
        return DTSerializer(databaseCon.Data);

    }

    public string profile_get_loadcontestants(string _eventID)
    {
        DataTable _contestantsDT = new DataTable();
        DataTable _scoresDT = new DataTable();
        DataTable _judgesDT = new DataTable();

        resultaccount= new DataTable();
        resultaccount.Columns.Add("PersonID", typeof(string));
        resultaccount.Columns.Add("Name", typeof(string));
        resultaccount.Columns.Add("FScore", typeof(string));

        databaseCon.ExecuteStoredProc("MCspViewContestantsEvent", "@EventID", _eventID);
        if (databaseCon.Data.Rows.Count > 0)
            _contestantsDT = databaseCon.Data;

        foreach (DataRow cont in _contestantsDT.Rows)
        {
            string fullname = cont.Field<string>(1);
            double final = 0;
            double total = 0;
            int judgectr = 0;

            databaseCon.ExecuteCommand("SELECT EventJudgesID FROM EventJudges WHERE EventID = " + _eventID);
            int CID = cont.Field<int>(0);
            if (databaseCon.Data.Rows.Count > 0)
                _judgesDT = databaseCon.Data;
            foreach (DataRow judge in _judgesDT.Rows)
            {
                judgectr++;
                databaseCon.ExecuteStoredProc("MCspViewScoreWeight", "@ContestantID", CID.ToString(), "@EventJudgesID", judge.Field<int>(0));
                if (databaseCon.Data.Rows.Count > 0)
                    _scoresDT = databaseCon.Data;
                foreach (DataRow sco in _scoresDT.Rows)
                {
                    double score = sco.Field<double>(0) / 10;
                    double weight = sco.Field<double>(1);
                    total += score * weight;
                }
            }
            final += total / judgectr;
            databaseCon.ExecuteCommand("UPDATE Contestant SET TotalScore = " + final.ToString() + "WHERE ContestantID = " + CID.ToString());
            //need ko nalang ng personid,name at score tapos mag add sa new datatable
            resultaccount.Rows.Add(cont.Field<int>(2).ToString(), fullname, final.ToString());
        }



        return DTSerializer(resultaccount);
    }

    public string profile_get_eventstatus(string _eventID)
    {
        bool IsResultsFinalize = true;

        databaseCon.ExecuteStoredProc("MCspViewOfficialResults", "@EventID", _eventID);
        if (databaseCon.Data.Rows.Count > 0)
            foreach (DataRow scores in databaseCon.Data.Rows)
            {
                if (scores.Field<double>(0) == 0)
                    IsResultsFinalize = false;
            }
        return IsResultsFinalize.ToString();
    }


    #endregion


}


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
    public void MCspUpdateScore(int EventJudgeID, int ContestantID, int EventCriteriaID, float Score)
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
    public void spRemoveJudgefromEventJudges(string fname, string lname, string uname, string pass)
    {
        databaseCon.ExecuteStoredProc("spRemoveJudgefromEventJudges", "@fname", fname, "@lname", lname, "@uname", uname, "@pass", pass);
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


}


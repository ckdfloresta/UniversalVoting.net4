using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    void KFspAddConNum(string fname, string lname, int eventID, int connum);
    [OperationContract]
    void KFspAddExistingPersontoContestant(string fname, string lname, int eventID);
    [OperationContract]
    void KFspAddPersonToContestant(string fname, string lname, int eventID);
    [OperationContract]
    DataTable KFspCheckConExistance(string fname, string lname, int eventID);
    [OperationContract]
    DataTable KFspCheckconnameavailability(string fname, string lname);
    [OperationContract]
    DataTable KFspCheckEventAccount(string epname, string euname);
    [OperationContract]
    DataTable KFspCheckEventName(string ename);
    [OperationContract]
    DataTable KFspCheckEventPerson(string efname, string elname);
    [OperationContract]
    void KFspCreateEvent(string efname, string elname, string epname, string ename, string euname);
    [OperationContract]
    void KFspFinalizeEvent(string eventid);
    [OperationContract]
    void KFspPopulateScores(string confname, string conlname, string judgefname, string judgelname, string judgeuname, string judgepass, int eventid, string critname);
    [OperationContract]
    void KFspRemoveContsestantFromEvent(string fname, string lname, string eventid);
    [OperationContract]
    void KFspUpdateContestant(string fname, string lname, int perid);
    [OperationContract]
    DataTable KFspViewEventContestants(int eventid);
    [OperationContract]
    DataTable KFspViewNotEventContestants(int eventid);
    [OperationContract]
    DataTable MCspGetEventCriteriaID(string Name, int EventJudgeID);
    [OperationContract]
    void MCspUpdateScore(int EventJudgeID, int ContestantID, int EventCriteriaID, float Score);
    [OperationContract]
    DataTable MCspViewContestant(int ContestantID);
    [OperationContract]
    DataTable MCspViewContestants(string EventName);
    [OperationContract]
    DataTable MCspViewContestantsEvent(int EventID);
    [OperationContract]
    DataTable MCspViewCriteria(int EventJudgeID);
    [OperationContract]
    DataTable MCspViewJudgeEvent(string EventName, int JID);
    [OperationContract]
    DataTable MCspViewJudges(int JudgeID);
    [OperationContract]
    DataTable MCspViewOfficialResults(int EventID);
    [OperationContract]
    DataTable MCspViewScore(int EventJudgeID, int ContestantID, int EventCriteriaID);
    [OperationContract]
    DataTable MCspViewScoreWeight(int ContestantID, int EventJudgeID);
    [OperationContract]
    DataTable MCspViewStatus(string EventName, int JudgeID, int ContestantID);
    [OperationContract]
    void spAddCriteriaToEventCriteria(string cname, int weight, int eventid);
    [OperationContract]
    void spAddJudgeToEventJudges(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    void spAddOldCriteriaToEventCriteria(string cname, int weight, int eventid);
    [OperationContract]
    void spAddPersonToEventJudges(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    DataTable spCheckCExistance(string cname, int eventid);
    [OperationContract]
    DataTable spCheckcnameavailability(string cname);
    [OperationContract]
    DataTable spCheckPersonExistanceinEvent(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    DataTable spCheckUnameavailability(string judgechars);
    [OperationContract]
    void spRemoveCriteriaFromEventCriteria(string cname, int eventid);
    [OperationContract]
    void spRemoveJudgefromEventJudges(string fname, string lname, string uname, string pass);
    [OperationContract]
    void spUpdateEventCriteria(string cname, int weight, int eventid, int critid);
    [OperationContract]
    void spUpdatePersonJudgeDetails(int personid, string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    DataTable spViewEventCriteria(int eventid);
    [OperationContract]
    DataTable spViewEventJudges(int eventid);
    [OperationContract]
    DataTable spViewNotEventCriteria(int eventid);
    [OperationContract]
    DataTable spViewNotEventJudges(int eventid);
}

WITH landmarkGravityForm AS (
    SELECT * FROM combinedTables.gravityformsCombined 
    WHERE form_name = 'liveatlandmarkwhitefish_form1'
),
landmarkCrm AS (
    SELECT 
        Email AS CRM_Email,
        Contact_Created_Date AS CRM_Contact_Created_Date,
        Last_Modified_Date AS CRM_Last_Modified_Date,
        Lead_Source AS CRM_Lead_Source,
        Contact_Type AS CRM_Contact_Type,
        dealId AS CRM_dealId,
        Deal_Name AS CRM_Deal_Name,
        Stage_Original AS CRM_Stage_Original,
        Deal_Description AS CRM_Deal_Description,
        Amount AS CRM_Amount,
        Deal_Created_Date AS CRM_Deal_Created_Date,
        Deal_Probability AS CRM_Deal_Probability,
        Deal_Closed_Date AS CRM_Deal_Closed_Date,
        Deal_Closed_Reason AS CRM_Deal_Closed_Reason

     FROM combinedTables.crmCombined
    WHERE CRM_System = 'landmarkHubspot'
),

landmarkGoogleAnalytics AS (SELECT * FROM combinedTables.googleanalyticsCombined WHERE account = 'landmark'),

gravityCRMCombined AS (SELECT * FROM landmarkGravityForm 
LEFT JOIN landmarkCrm
ON landmarkGravityForm.Email = landmarkCrm.CRM_Email),

gravityCRMGACombined AS (SELECT * FROM gravityCRMCombined LEFT JOIN landmarkGoogleAnalytics ON gravityCRMCombined.gaClientId = CAST(landmarkGoogleAnalytics.clientID AS FLOAT64))

SELECT * EXCEPT(clientID, account) FROM gravityCRMGACombined









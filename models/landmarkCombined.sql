WITH landmarkGravityForm AS (
    SELECT * FROM combinedTables.gravityformsCombined 
    WHERE form_name = 'liveatlandmarkwhitefish_form1'
),
landmarkCrm AS (
    SELECT * FROM combinedTables.crmCombined
    WHERE CRM_System = 'landmarkHubspot'
)

SELECT * FROM landmarkGravityForm 
LEFT JOIN landmarkCrm
ON landmarkGravityForm.Email = landmarkCrm.Email





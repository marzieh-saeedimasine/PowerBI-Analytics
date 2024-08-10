SELECT t.ID,  tr.Reason as Reason_for_absence , Month_absence,
CASE
WHEN Month_absence  in (12,1,2) THEN "Winter"
WHEN Month_absence in (3,4,5) THEN "Sprig"
WHEN Month_absence in (6,7,8) THEN "Sommer"
WHEN Month_absence in (9,10,11) THEN "Fall"
ELSE "Unknown"
END as Seasons_absence,Seasons,
Day_week,Transportation_expense,Distance_Residence_Work,Service_time,Age,Workload_Average_day,Hit_Target,
Disciplinary_failure,Education,Son,Social_drinker,Social_smoker,Pet,Weight,Height,
Bodymass_index,
CASE
WHEN Bodymass_index < 18.5 THEN "UnderWeight" 
WHEN Bodymass_index >18.5 and Bodymass_index < 25 THEN "Healthy"
WHEN Bodymass_index >25 and Bodymass_index < 30 THEN "OverWeight"
WHEN Bodymass_index >30 THEN "Obese"
ELSE "Unknown"
END as MBI_category,
Absenteeism_time_hours, tc.compensation_hr
FROM absenteeism_at_work t
left join reasons tr ON t.Reason_for_absence=tr.Number
left join compensation tc ON t.ID=tc.ID;




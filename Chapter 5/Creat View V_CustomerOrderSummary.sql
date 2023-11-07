CREATE OR REPLACE VIEW V_CustomerOrderSummary AS
SELECT S.State,
  sum(O.TotalDue) AS Total_Sales,
  min(O.TotalDue) AS Min_Due,
  max(O.TotalDue) AS Max_Due,
  avg(O.TotalDue) AS Avg_Due
FROM Orders O
  JOIN Salesperson S on O.SalespersonID = S.SalespersonID
GROUP BY S.State
ORDER BY sum(TotalDue) DESC
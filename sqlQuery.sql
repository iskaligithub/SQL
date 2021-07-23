use AP

select distinct InvoiceID into #multipleLines from Invoices;
select * from InvoiceLineItems where InvoiceSequence > 1

select i.VendorID, i.InvoiceNumber, i.InvoiceDate, i.InvoiceTotal, 
l.InvoiceLineItemAmount, l.InvoiceLineItemDescription, l.AccountNo
into #details
from Invoices i 
join #multipleLines m on i.InvoiceID = m.InvoiceID
join InvoiceLineItems l on i.InvoiceID = l.InvoiceID

select d.*, v.VendorName, g.AccountDescription
into #details2
from #details d
join Vendors v on d.VendorID = v.VendorID
join GLAccounts g on d.AccountNo = g.AccountNo

select * from #details2 order by AccountNo, InvoiceLineItemAmount


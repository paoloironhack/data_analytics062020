{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;\red244\green246\blue249;\red0\green0\blue0;
\red255\green255\blue255;\red109\green109\blue109;\red21\green23\blue26;}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;\cssrgb\c96471\c97255\c98039;\csgray\c0;
\cssrgb\c100000\c100000\c100000;\cssrgb\c50196\c50196\c50196;\cssrgb\c10588\c12157\c13725\c30196;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl380\partightenfactor0

\f0\fs27\fsmilli13600 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 USE lab_mysql;\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\fs22 \cf4 \cb1 \kerning1\expnd0\expndtw0 \CocoaLigature0 \outl0\strokewidth0  CREATE TABLE Cars\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     VIN int(20) NOT NULL,\
     Manufacturer VARCHAR(255),\
     Model VARCHAR(255),\
     Year Year,\
     Colour Varchar(255)\
     );\
\
Create Table Customers\
    (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Customer_ID Int(20) NOT NULL,\
     Name VARCHAR(255),\
     Email VARCHAR(255),\
     Address VARCHAR(255),\
     City VARCHAR(255),\
     State_Province VARCHAR(255),\
     ZIP_Code Int(10)\
     );\
\
CREATE TABLE Salespersons\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Employee_ID INT(20)NOT NULL,\
     Name VARCHAR(255),\
     Store VARCHAR(255)\
     );\
\
 CREATE TABLE Invoices\
     (\
     ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,\
     Invoice_Nr INT(20) NOT NULL,\
     Date DATE,\
     Car INT,\
     Customer INT,\
     Salesperson INT\
     );\
\

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrt\brdrnil \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clmrg \clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\fs24 \cf2 \expnd0\expndtw0\kerning0
\CocoaLigature1 \outl0\strokewidth0 \strokec2 \cell 
\pard\intbl\itap1\cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trcbpat5 \trbrdrl\brdrnil \trbrdrt\brdrnil \trbrdrr\brdrnil 
\clvertalt \clshdrawnil \clwWidth3434\clftsWidth3 \clminw1000 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx4320
\clvertalt \clshdrawnil \clwWidth7046\clftsWidth3 \clbrdrt\brdrnil \clbrdrl\brdrnil \clbrdrb\brdrnil \clbrdrr\brdrnil \clpadl200 \clpadr200 \gaph\cellx8640
\pard\intbl\itap1\pardeftab720\sl400\qr\partightenfactor0
\cf7 \strokec7 \cell 
\pard\intbl\itap1\pardeftab720\sl400\partightenfactor0
\cf2 \strokec2 \cell \lastrow\row
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\fs22 \cf4 \kerning1\expnd0\expndtw0 \CocoaLigature0 \outl0\strokewidth0 \
\
\
\
}
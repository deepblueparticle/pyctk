/*=========================================================================

  Library:  PyCTK
  Filename: ctkCallback.sip

  Copyright (c) 2015 Lamond Lab

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0.txt

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

=========================================================================*/

class ctkCallback : public QObject
{

%TypeHeaderCode
#include "ctkCallback.h"
%End

public:

  ctkCallback(QObject * parentObject /TransferThis/ = 0);
  // ctkCallback(void (*callback)(void * data), QObject * parentObject /TransferThis/ = 0);
  virtual ~ctkCallback();

  //void (*callback()const)(void*);
  //void setCallback(void (*callback)(void * data)); 
  void * callbackData() const;
  void setCallbackData(void * data);
  
public Q_SLOTS:
  virtual void invoke();
};


"use strict";

let Load = require('./Load.js')
let AddToLog = require('./AddToLog.js')
let GetLoadedProgram = require('./GetLoadedProgram.js')
let GetRobotMode = require('./GetRobotMode.js')
let RawRequest = require('./RawRequest.js')
let IsProgramSaved = require('./IsProgramSaved.js')
let GetProgramState = require('./GetProgramState.js')
let IsProgramRunning = require('./IsProgramRunning.js')
let GetSafetyMode = require('./GetSafetyMode.js')
let Popup = require('./Popup.js')

module.exports = {
  Load: Load,
  AddToLog: AddToLog,
  GetLoadedProgram: GetLoadedProgram,
  GetRobotMode: GetRobotMode,
  RawRequest: RawRequest,
  IsProgramSaved: IsProgramSaved,
  GetProgramState: GetProgramState,
  IsProgramRunning: IsProgramRunning,
  GetSafetyMode: GetSafetyMode,
  Popup: Popup,
};

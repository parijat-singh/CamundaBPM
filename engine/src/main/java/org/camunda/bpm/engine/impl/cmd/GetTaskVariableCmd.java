/*
 * Copyright © 2013-2019 camunda services GmbH and various authors (info@camunda.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.camunda.bpm.engine.impl.cmd;

import static org.camunda.bpm.engine.impl.util.EnsureUtil.ensureNotNull;

import java.io.Serializable;

import org.camunda.bpm.engine.impl.cfg.CommandChecker;
import org.camunda.bpm.engine.impl.context.Context;
import org.camunda.bpm.engine.impl.interceptor.Command;
import org.camunda.bpm.engine.impl.interceptor.CommandContext;
import org.camunda.bpm.engine.impl.persistence.entity.TaskEntity;


/**
 * @author Tom Baeyens
 */
public class GetTaskVariableCmd implements Command<Object>, Serializable {

  private static final long serialVersionUID = 1L;
  protected String taskId;
  protected String variableName;
  protected boolean isLocal;

  public GetTaskVariableCmd(String taskId, String variableName, boolean isLocal) {
    this.taskId = taskId;
    this.variableName = variableName;
    this.isLocal = isLocal;
  }

  public Object execute(CommandContext commandContext) {
    ensureNotNull("taskId", taskId);
    ensureNotNull("variableName", variableName);

    TaskEntity task = Context
      .getCommandContext()
      .getTaskManager()
      .findTaskById(taskId);

    ensureNotNull("task " + taskId + " doesn't exist", "task", task);

    checkGetTaskVariable(task, commandContext);

    Object value;

    if (isLocal) {
      value = task.getVariableLocal(variableName);
    } else {
      value = task.getVariable(variableName);
    }

    return value;
  }

  protected void checkGetTaskVariable(TaskEntity task, CommandContext commandContext) {
    for(CommandChecker checker : commandContext.getProcessEngineConfiguration().getCommandCheckers()) {
      checker.checkReadTaskVariable(task);
    }
  }
}

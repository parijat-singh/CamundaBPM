/**
 * Copyright (C) 2011, 2012 camunda services GmbH
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.camunda.fox.platform.impl.deployment.spi;

import java.util.Map;

import com.camunda.fox.platform.spi.ProcessArchive;

/**
 * <p>Scans a process archive for deployables.</p>
 *  
 * @author Daniel Meyer
 */
public interface ProcessArchiveScanner {
    
  public Map<String, byte[]> findResources(ProcessArchive processArchive);
  
  public static class ScanningUtil {
    public static String MARKER_FILE_LOCATION = "META-INF/processes.xml";
    
    public static boolean isDeployable(String filename) {
      return filename.endsWith(".bpmn20.xml") 
             || filename.endsWith(".bpmn"); 
    }
    
  }

}

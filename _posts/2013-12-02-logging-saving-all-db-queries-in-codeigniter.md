---
layout: post
title: Logging/Saving all DB queries in Codeigniter
---

> Archived from old blog

I had came across this requirement of saving all the Database Queries that are getting executed while running a application written in Codeigniter Framework. Though there are couple of other ways to achieve this including MYSQL Query Logging, i preferred to choose query logging at PHP level with no specific purpose.

In the below post, i will show how to retrieve all the queries executed by Codeigniter’s Database Class along with their execution time and dump them into a text file for future reference. Since we would be making use of Hooks, i would recommend to read about it once incase if you are unaware of what they are.

First we would be enabling the Hooks by changing the config file in codeigniter’s **application/config/** folder. To do so set the following value in config file

```php

// Set the following value in applications/config/config.php file
 $config['enable_hooks'] = TRUE;

 ```

Then Open up your **hooks.php** file in config folder and add the following code in it

```php

$hook['post_controller'] = array(     // 'post_controller' indicated execution of hooks after controller is finished
    'class' => 'Db_log',             // Name of Class
    'function' => 'logQueries',     // Name of function to be executed in from Class
    'filename' => 'db_log.php',    // Name of the Hook file
    'filepath' => 'hooks'         // Name of folder where Hook file is stored
);

```

Now we will create the hook with name **db_log.php** which we have set above and save it in **application/hooks/** folder. Then we simply put the following code in this file

```php

// Name of Class as mentioned in $hook['post_controller]
class Db_log {function __construct() {
       // Anything except exit() :P
    }// Name of function same as mentioned in Hooks Config
    function logQueries() {$CI = & get_instance();$filepath = APPPATH . 'logs/Query-log-' . date('Y-m-d') . '.php'; // Creating Query Log file with today's date in application/logs folder
        $handle = fopen($filepath, "a+");                 // Opening file with pointer at the end of the file$times = $CI->db->query_times;                   // Get execution time of all the queries executed by controller
        foreach ($CI->db->queries as $key => $query) {
            $sql = $query . " \n Execution Time:" . $times[$key]; // Generating SQL file alongwith execution time
            fwrite($handle, $sql . "\n\n");              // Writing it in the log file
        }fclose($handle);      // Close the file
    }}

```


Now every time any of your controller gets executed, the DB queries if executed any will be logged in Query_log file in Logs folder. Do note that you need to give write access to your **application/logs** folder. You can also download these files from bitbucket [here](https://bitbucket.org/jigarjain/codeigniter-log-all-db-queries-in-log-file/src/master/)





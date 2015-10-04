From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 61511] scanf man page is incomplete re out-of-range integer
 conversions
Date: Sun, 04 Oct 2015 21:09:00 +0000
Message-ID: <bug-61511-11311-qHKddemFmu@https.bugzilla.kernel.org/>
References: <bug-61511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-61511-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61511

Jon Harper <jon.harper87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jon.harper87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #3 from Jon Harper <jon.harper87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
strtod(3) has the following note:
NOTES
       Since 0 can legitimately be returned on both success and failure, the
calling program should set errno to 0 before the call, and
       then determine if an error occurred by checking whether errno has a
nonzero value after the call.

Maybe add the same note to scanf(3) ?


Also, the example program from scanf(3) is:
           char *p;
           int n;

           errno = 0;
           n = scanf("%m[a-z]", &p);
           if (n == 1) {
               printf("read: %s\n", p);
               free(p);
           } else if (errno != 0) {
               perror("scanf");
           } else {
               fprintf(stderr, "No matching characters\n");
           }

which suggests checking for the return value of scanf before checking for
errno, which is wrong in the integer overflow case as scanf returns 1. Change
the order of the checks ?


Also, for scanf, it doesn't set i to a constant value (adapting the example
program to read an int):
jon@zog:~$ cat dez.c 
#include "stdlib.h"
#include "stdio.h"
#include "errno.h"

int main() {
           int res;
           int n;

           errno = 0;
           n = scanf("%d", &res);
           if (n == 1) {
               printf("read: %d\n", res);
           } else if (errno != 0) {
               perror("scanf");
           } else {
               fprintf(stderr, "No matching characters\n");
           }
}

jon@zog:~$ for ((i=0; i<30; i++)); do echo "$((10**i -1))" | ./dez; done
read: 0
read: 9
read: 99
read: 999
read: 9999
read: 99999
read: 999999
read: 9999999
read: 99999999
read: 999999999
read: 1410065407
read: 1215752191
read: -727379969
read: 1316134911
read: 276447231
read: -1530494977
read: 1874919423
read: 1569325055
read: -1486618625
read: -1981284353
read: 1661992959
read: -559939585
read: -1304428545
read: -159383553
read: -1593835521
read: 1241513983
read: -469762049
read: -402653185
read: 268435455
read: -1610612737

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Valery Reznic <valery_reznic-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: execve man page
Date: Sun, 21 Mar 2010 01:41:16 -0700 (PDT)
Message-ID: <485015.29084.qm@web110302.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi, somewhere between Fedora 8 and Fedora 12 (2.6.31.5-127.fc12)
execve system call was changed to accept script interpreter that interpreter itself.
But man execve still said:
-----------------------------------------------------
  Interpreter scripts
       An  interpreter  script  is  a  text  file  that has execute permission
       enabled and whose first line is of the form:

           #! interpreter [optional-arg]

       The interpreter must be a valid pathname for an executable which is NOT
       ITSELF  A  SCRIPT. 
-----------------------------------------------------
It's a bit out of date now.

Regards,
Valery


      
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

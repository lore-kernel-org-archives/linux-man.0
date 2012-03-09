From: "jesus.otero " <jesus.otero-zg5kjA6Mr10@public.gmane.org>
Subject: A bug? in the perror man page
Date: Fri, 9 Mar 2012 11:36:14 +0100 (CET)
Message-ID: <27915272.87611331289374219.JavaMail.defaultUser@defaultHost>
Mime-Version: 1.0
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

Not sure if this is a bug, but, just in case...

When searching how to print error messages without using perror, the man page 
of perror says 

"The  global error list sys_errlist[] indexed by errno can be used to obtain 
the error message without the newline. The largest message number provided in 
the table is sys_nerr -1.  Be careful when  directly  accessing  this  list 
because new error values may not have been added to sys_errlist[]."

Searching for sys_errlist on the kernel includes pointed me to the file 
<bits/sys_errlist.h> where it says that sys_errlist[] is deprecated, 
recommending you to use strerror. Doing a google search confirm me this.

Shouldn't this be reflected on perror's man page?

I'm running an Ubuntu 10.04.4 LTS
My kernel version 2.6.32-39-generic-pae
I've installed the man page for perror version 3.23-1

Thanks

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

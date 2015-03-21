From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95191] document behavior of open(2) when path names a  fifo
 with no readers
Date: Sat, 21 Mar 2015 20:55:04 +0000
Message-ID: <bug-95191-11311-KgitxadcUu@https.bugzilla.kernel.org/>
References: <bug-95191-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-95191-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95191

--- Comment #4 from Jason Vas Dias <jason.vas.dias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Should have added:
To test: 
  Save attachment #1 as t_sigio_writer.c
  Save attachment #2 as t_sigio_writer_no_open.c
  $ gcc -o t_sigio_writer t_sigio_writer.c
  $ mkfifo /tmp/a.fifo
  $ ./t_sigio_writer /tmp/a.fifo &
  $ read -d $'\004' res < /tmp/a.fifo && echo "RES: $res"
  RES:
  $
  $ gcc -o t_sigio_writer_no_open t_sigio_writer_no_open.c
  $ ./t_sigio_writer_no_open </tmp/a.fifo &
  $ read -d $'\004' res < /tmp/a.fifo && echo "RES: $res"
  ^C

An strace of 2nd process, which only does fcntl(1,F_SETFL,flags|O_ASYNC),
and does identical signal handling, that had to be killed,  shows it only
gets a SIGIO on FD 0, not on FD 1, after <CTRL+C> is pressed.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

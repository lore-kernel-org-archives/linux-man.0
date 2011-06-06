From: haider abbas <haiderabbasphy-/E1597aS9LQxFYw1CcD5bw@public.gmane.org>
Subject: shared memory
Date: Mon, 6 Jun 2011 22:29:09 +0530 (IST)
Message-ID: <498127.91821.qm@web95510.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I have installed ubuntu 10.04 on a lenovo desktop.
I need to increase shared memory permanently to run some program.
I add
kernel.shmall = 4294967296
 kernel.shmmax = 4294967296
in /etc/sysctl.conf

but when I run the command  sysctl -a|grep shmmax it shows
root@haider-desktop:~# sysctl -a|grep shmmax
kernel.shmmax = 0
error: "Invalid argument" reading key "fs.binfmt_misc.register"
error: permission denied on key 'net.ipv4.route.flush'
error: permission denied on key 'net.ipv6.route.flush'
root@haider-desktop:~#

I again run the command /etc/sysctl.conf -w
 then it shows
root@haider-desktop:~# /etc/sysctl.conf -w
bash: /etc/sysctl.conf: Permission denied
root@haider-desktop:~#

Then I try echo 4294967296 >> /proc/sys/kernel/shmmax
but no changes took place.
Then I use some trick, I make a dummy file and when I copied or 
move to  /proc/sys/kernel then it shows.
No such file or directory
root@haider-desktop:~# 

however I am the running these command by root
I dont understand what is going on what is the actual problem

with regards
Dr. Haider Abbas
Manav Rachna College of Engineering
Faridabad, India
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

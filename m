From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH 0/1] Manpages for the fanotify API: FAN_ACCESS_PERM for
 readdir
Date: Mon, 7 Apr 2014 22:13:41 +0200
Message-ID: <20140407201341.GD23670@quack.suse.cz>
References: <5330A257.9080100@gmail.com>
 <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de>
 <20140407085624.GB14927@quack.suse.cz>
 <5342EB7B.4010201@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5342EB7B.4010201-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon 07-04-14 20:16:27, Heinrich Schuchardt wrote:
> Hello Jan,
> 
> >> FAN_ACCESS_PERM
> >> The name is misleading. The permission check is done before executing a file
> >> or listing a directory.
> >  AFAIK it doesn't happen before listing a directory. But if you are
> >convinced it does, I can check more carefully ;)
> 
> iterate_dir calls
> security_file_permission(file, MAY_READ);
> which in turn calls
> fsnotify_perm(file, mask);
> Which has these lines:
>  51         else if (mask & MAY_READ)
>  52                 fsnotify_mask = FS_ACCESS_PERM;
  Ah, OK, for FAN_ACCESS_PERM. But as you note below FAN_ACCESS isn't
generated for directories. That actually looks pretty inconsistent and I
guess we should fix that.

> This is the result I get for
> #include <stdlib.h>
> #include <sys/types.h>
> #include <dirent.h>
> #include <libgen.h>
> int main() {
>     DIR *dir;
>     struct dirent *dp;
>     if ((dir = opendir ("/home/test")) == NULL) {
>         exit (1);
>     }
>     while ((dp = readdir (dir)) != NULL) {
>         }
>         closedir(dir);
>         return 0;
> }
> 
> FAN_OPEN: File /home/test
> FAN_ACCESS_PERM: File /home/test
> FAN_ACCESS_PERM: File /home/test
> 
> I guess it is somewhat inconsistent that
> readdir results in FAN_ACCESS_PERM while
> read results in FAN_ACCESS_PERM and FAN_ACCESS.
> 
> ===
> 
> This is the result I get for executing
> /home/test/test
> which contains the following lines
> !#/bin/sh
> echo Hello world
> 
> FAN_OPEN: File /home/test/test
> FAN_ACCESS_PERM: File /home/test/test
> FAN_ACCESS: File /home/test/test
> FAN_OPEN: File /home/test/test
> FAN_ACCESS_PERM: File /home/test/test
> FAN_ACCESS: File /home/test/test
> FAN_ACCESS_PERM: File /home/test/test
> 
> The last FAN_ACCESS_PERM probably does not relate to a read() as it
> is not followed by FAN_ACCESS.
> 
> ===
> 
> When running
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> int main(int argc, char *argv[]) {
>     int fd;
>     char buf[4096];
>     ssize_t len;
>     fd = open("/home/test/test", O_RDONLY);
>     len = read(fd, buf, 4096);
>     buf[len] = '\0';
>     printf("Bytes read %d\n%s\n", len, buf);
>     close(fd);
>     return 0;
> }
> 
> I get
> 
> FAN_OPEN: File /home/test/test
> FAN_ACCESS_PERM: File /home/test/test
> FAN_ACCESS: File /home/test/test
> 
> When running
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> 
> int main(int argc, char *argv[]) {
>         int fd;
>         char buf[4096];
>         ssize_t len;
>     fd = open("/home/test/test", O_WRONLY);
>     len = write(fd, "visited" , 4);
>         close(fd);
>         return 0;
> }
> 
> I get
> 
> FAN_OPEN: File /home/test/test
> FAN_MODIFY: File /home/test/test
> 
> You only receive a permission event before reading and not before writing.
> 
> The fanotify API was meant for use in a hierarchical storage
> management system. Should it not be able to inhibit writing, e.g. if
> the remote file is on a read-only medium?
> 
> I guess it would make sense to add a FAN_MODIFY_PERM event.
  Well, there were different uses for fanotify() (antivirus scanners for
file servers for windows workstations was the one I remember). Storage
management might be one of those. If there's a real demand for
FAN_MODIFY_PERM, I guess we can add that. But I wouldn't like to add that
just because it sounds useful...

								Honza
-- 
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH 0/1] Manpages for the fanotify API
Date: Mon, 7 Apr 2014 10:56:24 +0200
Message-ID: <20140407085624.GB14927@quack.suse.cz>
References: <5330A257.9080100@gmail.com>
 <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396742468-4752-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun 06-04-14 02:01:08, xypron.glpk-Mmb7MZpHnFY@public.gmane.org wrote:
> There needs to be some explanation of the events that are generated
> for directories. To begin with, *which* events are generated for
> directories?
> 
> * opening a directory for reading gives FAN_OPEN
> * closing the file descriptor from the previous
>   step gives FAN_CLOSE
> * Changing the directory contents (adding a file)
>   seems to give no event for the directory itself
>   (but will give an event on the new file, if we
>   are monitoring children of the directory)
> * Other???
  That's correct. fanotify doesn't give you any other events for
directories. It's really only useful for watching files and their contents.

> FAN_ACCESS_PERM
> The name is misleading. The permission check is done before executing a file
> or listing a directory.
  AFAIK it doesn't happen before listing a directory. But if you are
convinced it does, I can check more carefully ;)

								Honza
-- 
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

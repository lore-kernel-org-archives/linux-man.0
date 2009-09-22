From: Tim Stoakes <tim-TvTPyCxgtD3R7s880joybQ@public.gmane.org>
Subject: BUG: shm_overview notes mistype
Date: Tue, 22 Sep 2009 15:51:41 +0930
Message-ID: <20090922062141.GA11068@mail.rocksoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version 3.22, Gentoo linux

$ man shm_overview

In the NOTES section, second sentence:
"
System V shared memory (shmget(2), shmop(2), etc.) is an older semaphore
API.
"

It's not a semaphore API, it's a shared memory API.

Perhaps this is a paste-o from the sem_overview man page.

Tim

-- 
Tim Stoakes
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

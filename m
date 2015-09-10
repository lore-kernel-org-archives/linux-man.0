From: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH v2] mlock.2: mlock2.2: Add entry to for new mlock2 syscall
Date: Thu, 10 Sep 2015 11:31:49 +0200
Message-ID: <55F14E05.6020304@suse.cz>
References: <1441030820-2960-1-git-send-email-emunson@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441030820-2960-1-git-send-email-emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/31/2015 04:20 PM, Eric B Munson wrote:
> Update the mlock.2 man page with information on mlock2() and the new
> mlockall() flag MCL_ONFAULT.
> 
> Signed-off-by: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
> Acked-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>

Looks like I acked v1 too late and not v2, so:

Acked-by: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>

However, looks like it won't be in Linux 4.3 so that part is outdated.
Also, what about glibc wrapper for mlock2()? Does it have to come before or
after the manpage and who gets it in?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

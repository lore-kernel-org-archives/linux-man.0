From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 73301] Documentation misses case of link, linkat, symlink,
 symlinkat giving ENOENT for a directory with a reference only held by a
 process
Date: Fri, 02 May 2014 18:51:33 +0000
Message-ID: <bug-73301-11311-ivjiUHmvVI@https.bugzilla.kernel.org/>
References: <bug-73301-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-73301-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73301

--- Comment #3 from Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> ---
On further reflection, this is not a problem with the documentation of
symlink, symlinkat, link and linkat but a problem with the
documentation of ENOENT and what a nonexisting directory actually
means.

I suppose how one might describe the situation is that when a
directory is unlinked from a filesystem (but still has process
references to it) it enters a zombie state where many filesystem calls
become inappropriate to use on it.

I'm not sure where such documentation should be placed. We already
have shm_overview(7), mq_overview(7) and such; and I think if we had a
dir_overview(7) that would be the perfect place to put this corner
case. dir_overview(7) might be too big project for not really any gain
though.

> I'd be willing to give it a shot, but, first,I'm not sure what if
> anything to say about the symlink() case. Do you have a more
> realistic example of that case?

Nope. People should probably be able to figure that out from the
description of the symlink case. I was just pointing it out for
completeness and I'd be fine if that case was omitted.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

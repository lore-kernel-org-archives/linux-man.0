From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Current state of CLONE_NEWUSER?
Date: Thu, 20 Nov 2008 06:49:54 -0500
Message-ID: <cfd18e0f0811200349q788c2767i5164dc1c47e67925@mail.gmail.com>
References: <cfd18e0f0811191204r4ccaeaf4m4145e67f408543e0@mail.gmail.com>
	 <m1vdujdvi6.fsf@frodo.ebiederm.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m1vdujdvi6.fsf-B27657KtZYmhTnVgQlOflh2eb7JE58TQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Serge Hallyn <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eric,

On Wed, Nov 19, 2008 at 8:41 PM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> Hi Serge,
>>
>> What is the current status of CLONE_NEWUSER?  I'm currently trying to
>> test this flag in preparation for documenting it in the clone(2) man
>> page, but am running into an ENOMEM error from the clone() call, which
>> seems to occur after a failure in kobject_init_and_add() in the
>> following call sequence:
>>
>> clone_user_ns() --> alloc_uid() --> uids_user_create() -->
>> kobject_init_and_add()
>>
>> Are there already some test programs somewhere?  Is there any
>> documentation already available for this flag?
>
> This code is definitely still under development.
>
> When complete it should be able to create a new uid namespace,
> as an unprivileged user.  Creating a new process with uid == gid == 0.
> Have a full set of caps.  And have permission to do nothing on the system
> except read world readable files and write world writable files.

Thanks for the info,

So the error I described is expected?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

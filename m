From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: CLONE_NEWUTS documentation
Date: Mon, 24 Nov 2008 18:14:24 -0500
Message-ID: <cfd18e0f0811241514l121ecdb9l3e424f45df78e5b8@mail.gmail.com>
References: <492464F8.8070101@gmail.com> <20081123224708.GC12687@hallyn.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081123224708.GC12687-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Herbert Poetzl <herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org>, Andrey Savochkin <saw-3ImXcnM4P+0@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Serge,

On Sun, Nov 23, 2008 at 5:47 PM, Serge E. Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org> wrote:
> Quoting Michael Kerrisk (mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org):
>> Serge, Eric,
>>
>> Below is a patch to document the CLONE_NEWUTS flag that was
>> added in 2.6.19.
>
> Thanks for writing this.

Thanks for replying ;-).

>> Could you please review and let me know of improvements
>> or inaccuracies?
>>
>> By the way, does anyone know where the UTS name in the uname()
>> API comes from? My best guess is that it's from Unix Timesharing
>> System, but I don't know this for sure.
>
> That sounds plausible - I've wondered myself and even googled a
> bit, but not found an answer.  I suppose we might need to ask
> Linus, or check one of the git repos that goes back to the early
> 90s and see who created the struct.

Oh -- "utsname" as a string (used in the uname() API) way predates Linux.

>> diff --git a/man2/clone.2 b/man2/clone.2
>> index 7212332..80f9caf 100644
>> --- a/man2/clone.2
>> +++ b/man2/clone.2
>> @@ -341,6 +340,33 @@ configuration option and that the process be privileged
>>  This flag can't be specified in conjunction with
>>  .BR CLONE_THREAD .
>>  .TP
>> +.BR CLONE_NEWUTS " (since Linux 2.6.19)"
>> +If
>> +.B CLONE_NEWUTS
>> +is set, then create the process in a new UTS namespace.
>
> And the new UTS namespace will initially be identical as the
> parent - same hostname and domainname.

Yes, it's a good idea to make that clear.  I've added some words to cover that.

>> +If this flag is not set, then (as with
>> +.BR fork (2)),
>> +the process is created in the same UTS namespace as
>> +the calling process.
>> +This flag is intended for the implementation of control groups.
>
> I'm not sure Eric was sufficiently clear - this flag is intended
> for the implementation of virtual server functionality and maybe
> checkpoint/restart (though I'm not sure any apps will care about
> being able to reset the hostname on restart :)
> It's not that you have to call it 'virtual server functionality',
> just that 'control groups' is definately not right.
>
> Maybe 'lightweight containers'?  "lightweight virtual servers'?

I just made it "containers".  Is that okay?

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

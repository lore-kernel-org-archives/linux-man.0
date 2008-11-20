From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: CLONE_NEWUTS documentation
Date: Thu, 20 Nov 2008 06:51:26 -0500
Message-ID: <cfd18e0f0811200351o7cf40438j195fbac14854f79a@mail.gmail.com>
References: <492464F8.8070101@gmail.com> <m1y6zfgpjf.fsf@frodo.ebiederm.org>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754589AbYKTLvm@vger.kernel.org>
In-Reply-To: <m1y6zfgpjf.fsf@frodo.ebiederm.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: "Serge E. Hallyn" <serue@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org, Kirill Korotaev <dev@openvz.org>, Herbert Poetzl <herbert@13thfloor.at>, Andrey Savochkin <saw@sw.ru>, Subrata Modak <subrata@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Eric,

On Wed, Nov 19, 2008 at 8:21 PM, Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Michael Kerrisk <mtk.manpages@googlemail.com> writes:
>
>> Serge, Eric,
>>
>> Below is a patch to document the CLONE_NEWUTS flag that was
>> added in 2.6.19.
>>
>> Could you please review and let me know of improvements
>> or inaccuracies?
>>
>> By the way, does anyone know where the UTS name in the uname()
>> API comes from? My best guess is that it's from Unix Timesharing
>> System, but I don't know this for sure.
>>
>> Cheers,
>>
>> Michael
>>
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
>> +If this flag is not set, then (as with
>> +.BR fork (2)),
>> +the process is created in the same UTS namespace as
>> +the calling process.
>
>> +This flag is intended for the implementation of control groups.
>
> See my previous email about containers vs control groups.

Otherwise, the documentation patch is okay?

> There are some corner cases with NFS usage in the kernel that still
> need to be resolved but otherwise the uts namespace is considered correct
> and complete.

Thanks for the info.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html

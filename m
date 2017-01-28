From: Pavel Tikhomirov <ptikhomirov-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Document new PR_SET_CHILD_SUBREAPER semantics
Date: Sat, 28 Jan 2017 09:38:31 +0300
Message-ID: <39f3a8c2-cad6-be8a-1843-d43e228a8326@virtuozzo.com>
References: <20170127100543.18390-1-ptikhomirov@virtuozzo.com>
 <20170127101125.18709-1-ptikhomirov@virtuozzo.com>
 <CAKgNAkhg-JankZ1LNV38DHtat5HrUKKK1YO2s1figbHQ5GMhcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhg-JankZ1LNV38DHtat5HrUKKK1YO2s1figbHQ5GMhcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, Stanislav Kinsburskiy <skinsbursky-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, Mateusz Guzik <mguzik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, Konstantin Khorenko <khorenko-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, "Eric W . Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/28/2017 01:47 AM, Michael Kerrisk (man-pages) wrote:
> Hello Pavel,
>
> On 27 January 2017 at 23:11, Pavel Tikhomirov <ptikhomirov-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org> wrote:
>> old semantics was non deterministic and worked differently
>> depending on the external factors, but nothing changes if
>> process first sets itself subreaper and only after forks
>
> When did the kernel behavior change?

Sorry for inconvenience, should have added you to cc of a main patch also.

Kernel behavior haven't changed yet, doc change will be a continuation 
of "[PATCH v2 0/2] prctl: make PR_SET_CHILD_SUBREAPER deterministic", 
see https://lkml.org/lkml/2017/1/27/108

>
> Cheers,
>
> Michael
>
>
>> Signed-off-by: Pavel Tikhomirov <ptikhomirov-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
>> ---
>>  man2/prctl.2 | 24 +++++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/man2/prctl.2 b/man2/prctl.2
>> index 97cf21a..84fbd7e 100644
>> --- a/man2/prctl.2
>> +++ b/man2/prctl.2
>> @@ -162,20 +162,30 @@ if
>>  is zero, unset the attribute.
>>
>>  When a process is marked as a child subreaper,
>> -all of the children that it creates, and their descendants,
>> +all of the children that it creates or have created already, and their descendants,
>>  will be marked as having a subreaper.
>>  In effect, a subreaper fulfills the role of
>>  .BR init (1)
>>  for its descendant processes.
>> -Upon termination of a process
>> -that is orphaned (i.e., its immediate parent has already terminated)
>> -and marked as having a subreaper,
>> -the nearest still living ancestor subreaper
>> -will receive a
>> +Upon termination of a process having a subreaper,
>> +all its children become orphaned
>> +and will be reparented to the nearest still living ancestor subreaper.
>> +So that on it's adopted child termination
>> +these subreaper will receive a
>>  .BR SIGCHLD
>>  signal and will be able to
>>  .BR wait (2)
>> -on the process to discover its termination status.
>> +on the child to discover its termination status.
>> +
>> +Note, that on older kernels these prctl works slightly different.
>> +Child subreaper process was not actualy the
>> +.BR init (1)
>> +for all its descendants.
>> +If process forks a child while not been a child subreaper,
>> +and after sets himself child subreaper,
>> +sub-tree of the child might or might not reparent to the subreaper,
>> +depending on the configuration of ancestors of the subreaper,
>> +at the time of forking our subtree.
>>  .TP
>>  .BR PR_GET_CHILD_SUBREAPER " (since Linux 3.4)"
>>  Return the "child subreaper" setting of the caller,
>> --
>> 2.9.3
>>
>
>
>

-- 
Best regards, Tikhomirov Pavel
Software Developer, Virtuozzo.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

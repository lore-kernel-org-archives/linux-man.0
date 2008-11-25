From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: Documentation for CLONE_NEWPID
Date: Tue, 25 Nov 2008 10:09:27 -0500
Message-ID: <cfd18e0f0811250709x4e2cc5cdhafb9ccf494890442@mail.gmail.com>
References: <4923810B.7010201@gmail.com> <20081123222023.GB12687@hallyn.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752800AbYKYPJm@vger.kernel.org>
In-Reply-To: <20081123222023.GB12687@hallyn.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Pavel Emelyanov <xemul@openvz.org>, Kir Kolyshkin <kir@openvz.org>, linux-man@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Sukadev Bhattiprolu <sukadev@us.ibm.com>, Nadia Derbey <Nadia.Derbey@bull.net>
List-Id: linux-man@vger.kernel.org

Hi Serge,

[...]

>> +PID namespaces form a hierarchy.
>> +When a PID new namespace is created,
>> +the PIDs of the processes in that namespace are visible
>
> The processes in that namespace are visible, but by different
> pids.  So saying that the pids are visible in the parent
> pidns isn't quite right.

Yes, good point.  I made that last line:

    "... the processes in that namespace are visible..."

>> +in the PID namespace of the process that created the new namespace;
>> +analogously, if the parent PID namespace is itself
>> +the child of another PID namespace,
>> +then PIDs of the child and parent PID namespaces will both be
>
> Again, the processes, not pids, are visible.

Yep.  Fixed.

[...]

>> +After creating the new namespace,
>> +it is useful for the child to change its root directory
>> +and mount a new procfs instance at
>> +.I /proc
>> +so that tools such as
>> +.BR ps (1)
>> +work correctly.
>
> Probably not worth mentioning here, but if it has done
> CLONE_NEWNS then it doesn't need to change its root, it
> can just mount a new proc instance over /proc.

Actually, I think it is worth mentioning.  When I wrote the text, I
suspected that the point you make here was true, but I wasn't 100%
sure.  Therefore, I think it worth adding a sentence like your comment
here, and I've done so.

[...]

> I assume you've considered the pros and cons of mentioning
> signal semantics with respect to init tasks of child pid namespaces,
> and decided it's not worth mentioning yet as the semantics are not
> yet finalized?
>
> The goal is to treat the process as a system-wide init with respect
> to signals coming from its own namespace, and treat it as an ordinary
> task for signals coming from its ancestor namespaces.  But as you've
> probably read, the implementation may result in some unfortunate
> side-effects regarding blocked signals etc.

No I haven't considered this at all.  Could you provide some pointers
to relevant discussions on this?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html

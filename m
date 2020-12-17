Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01731C4361B
	for <linux-man@archiver.kernel.org>; Thu, 17 Dec 2020 19:10:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD60F239EB
	for <linux-man@archiver.kernel.org>; Thu, 17 Dec 2020 19:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgLQTJ6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 17 Dec 2020 14:09:58 -0500
Received: from out03.mta.xmission.com ([166.70.13.233]:37870 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgLQTJ6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 17 Dec 2020 14:09:58 -0500
X-Greylist: delayed 1375 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Dec 2020 14:09:57 EST
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kpyI6-003Dnp-MZ; Thu, 17 Dec 2020 11:46:18 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kpyI5-002lI8-Ei; Thu, 17 Dec 2020 11:46:18 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     "Alejandro Colomar \(man-pages\)" <alx.manpages@gmail.com>
Cc:     Oleg Nesterov <oleg@tv-sign.ru>, Jann Horn <jannh@google.com>,
        Ted Estes <ted@softwarecrafters.com>,
        Jann Horn <jann@thejh.net>, Pavel Emelyanov <xemul@openvz.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        linux-man <linux-man@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>
References: <feef4f9a-4ed8-8a2e-d330-88e7f516faae@gmail.com>
        <X9lBp3BHbwcTmDqb@pc.thejh.net>
        <0e5189c0-9e9b-ac34-825c-619a9a6ef682@gmail.com>
        <d38c5e8b-1653-d89a-a0c8-b95cb1844fba@gmail.com>
        <CAG48ez0y21uWBDuaczLMxLPpFTKABrgm+-aqLb-0a4rHuOCX-g@mail.gmail.com>
        <5062fe43-ca37-134f-89ad-57fbd8c312ba@softwarecrafters.com>
        <CAG48ez2g=U-H56g6VebQCiSXGg+bVvhBA5yfwymNxVYAGEJJcA@mail.gmail.com>
        <1abbf267-d522-0586-e5a5-c71f4d7b0fa4@gmail.com>
Date:   Thu, 17 Dec 2020 12:45:29 -0600
In-Reply-To: <1abbf267-d522-0586-e5a5-c71f4d7b0fa4@gmail.com> (Alejandro
        Colomar's message of "Wed, 16 Dec 2020 10:22:09 +0100")
Message-ID: <87eejouv92.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kpyI5-002lI8-Ei;;;mid=<87eejouv92.fsf@x220.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX190iekfNeZPMseo2lks32NWzQGjeRDvFXU=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [Bug 210655] ptrace.2: documentation is incorrect about access checking threads in same thread group
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

"Alejandro Colomar (man-pages)" <alx.manpages@gmail.com> writes:

> [CC += Thomas, Ingo, Peter, Darren]
>
> Hi Oleg,
>
> On 12/16/20 3:33 AM, Jann Horn wrote:
>> On Wed, Dec 16, 2020 at 3:21 AM Ted Estes <ted@softwarecrafters.com> wrote:
>>> On 12/15/2020 6:01 PM, Jann Horn wrote:
>>>> On Wed, Dec 16, 2020 at 12:25 AM Alejandro Colomar (man-pages)
>>>> <alx.manpages@gmail.com> wrote:
>>>>> On 12/16/20 12:23 AM, Alejandro Colomar (man-pages) wrote:
>>>>>> On 12/16/20 12:07 AM, Jann Horn wrote:
>>>>>>> As the comment explains, you can't actually *attach*
>>>>>>> to another task in the same thread group; but that's
>>>>>>> not because of the ptrace-style access check rules,
>>>>>>> but because specifically *attaching* to another task
>>>>>>> in the same thread group doesn't work.
>>>> As I said, attaching indeed doesn't work. But that's not what "Ptrace
>>>> access mode checking" means. As the first sentence of that section
>>>> says:
>>>>
>>>> | Various parts of the kernel-user-space API (not just ptrace()
>>>> | operations), require so-called "ptrace access mode" checks,
>>>> | whose outcome determines whether an operation is
>>>> | permitted (or, in a  few cases,  causes  a "read" operation
>>>> | to return sanitized data).
>>>>
>>>> You can find these places by grepping for \bptrace_may_access\b -
>>>> operations like e.g. the get_robust_list() syscall will always succeed
>>>> when inspecting other tasks in the caller's thread group thanks to
>>>> this rule.
>>>
>>> Ah, yes.  I missed that back reference while trying to digest that
>>> rather meaty man page.  A grep on the man page source tree does show a
>>> number of references to "ptrace access mode".
>>>
>>> That said, the ptrace(2) man page also directly references the ptrace
>>> access mode check under both PTRACE_ATTACH and PTACE_SEIZE:
>>>
>>> | Permission to perform a PTRACE_ATTACH is governed by a ptrace | access
>>> mode PTRACE_MODE_ATTACH_REALCREDS check; see below. As confirmed, the
>>> "same thread group" rule does not apply to either of those operations. A
>>> re-wording of rule 1 similar to this might help avoid confusion: 1. If
>>> the calling thread and the target thread are in the same thread group:
>>> a. For ptrace() called with PTRACE_ATTACH or PTRACE_SEIZE, access is
>>> NEVER allowed. b. For all other so-called "ptrace access mode checks",
>>> access is ALWAYS allowed. --Ted
>> 
>> Yeah, maybe. OTOH I'm not sure whether it really makes sense to
>> explain this as being part of a security check, or whether it should
>> be explained separately as a restriction on PTRACE_ATTACH and
>> PTRACE_SEIZE (with a note like "(irrelevant for ptrace attachment)" on
>> rule 1). But I don't feel strongly about it either way.
>> 
>
> As you are the maintainer for ptrace,
> could you confirm the above from Jan?
> And maybe suggest what you would do with the manual page.
>
> I'd like to get confirmation that there are still other functions that
> require "ptrace access mode" other than ptrace() itself, where it's
> valid that the calling thread and the target thread are in the same
> group.

Large swaths of proc are governed by those checks.

In general in the kernel whenever you are accessing another process to
perform an operation (especially reading) it will probably use
"ptrace access mode" checks.

You can see this by with "git grep ptrace_may_access" on the kernel source.

Eric

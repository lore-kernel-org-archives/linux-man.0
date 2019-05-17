From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Fri, 17 May 2019 17:44:41 +0200
Message-ID: <87y335m6fq.fsf@oldenburg2.str.redhat.com>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
	<8736liit24.fsf@oldenburg2.str.redhat.com>
	<20190513141746.mail6ny43wh4t5oj@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-102087-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20190513141746.mail6ny43wh4t5oj@localhost.localdomain>
	(G. Branden Robinson's message of "Tue, 14 May 2019 00:17:48 +1000")
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

* G. Branden Robinson:

>> I'm not sure if it makes sense to document this in the manual page.
>
> It might not; another resonable approach might be to nuke the "Bugs"
> section of the man page entirely.  However, see below.
>
>> I expect that the fix will propagate to affected distributions fairly
>> quickly, now that it is available upstream.
>
> True for fast-moving distributions; as I noted in the commit message,
> Debian 10 has already got it backported to its glibc 2.29.

I'm pretty sure Debian 10 does not use glibc 2.28.

My point is that the glibc change will get backported, but any man-pages
change will not, so it will be quite some time until the latter shows up
on developer workstations.  And due to glibc backporting, the version
information there will be misleading.

Thanks,
Florian

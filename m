From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Mon, 13 May 2019 11:48:19 +0200
Message-ID: <8736liit24.fsf@oldenburg2.str.redhat.com>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-101944-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
	(G. Branden Robinson's message of "Sat, 11 May 2019 17:20:52 +1000")
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

* G. Branden Robinson:

>  .SH BUGS
> -Since glibc 2.19,
> +From glibc 2.19 to 2.29,
>  .B pldd
> -is broken: it just hangs when executed.
> -.\" FIXME . https://sourceware.org/bugzilla/show_bug.cgi?id=18035
> -It is unclear if it will ever be fixed.
> +was broken: it just hung when executed.
> +.\" glibc commit 1a4c27355e146b6d8cc6487b998462c7fdd1048f
> +This problem was fixed in glibc 2.30.

I'm not sure if it makes sense to document this in the manual page.  I
expect that the fix will propagate to affected distributions fairly
quickly, now that it is available upstream.  It's certainly more likely
that users will receive a glibc update with the fix than a manpage
update with this change.

Thanks,
Florian

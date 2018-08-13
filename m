From: Andreas Schwab <schwab@suse.de>
Subject: Re: Are ut_user and ut_host in struct utmp NUL-terminated?
Date: Mon, 13 Aug 2018 14:44:25 +0200
Message-ID: <mvmeff2o2qe.fsf@suse.de>
References: <11742781-3872-5bbf-55d6-8ce597f21e53@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-95186-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <11742781-3872-5bbf-55d6-8ce597f21e53@redhat.com> (Florian
	Weimer's message of "Mon, 13 Aug 2018 14:10:52 +0200")
To: Florian Weimer <fweimer@redhat.com>
Cc: GNU C Library <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Aug 13 2018, Florian Weimer <fweimer@redhat.com> wrote:

> Can ut_user be exactly UT_NAMESIZE bytes long?  Or is it necessary to set
> aside a byte with the NUL terminator?

login from util-linux doesn't null terminate.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

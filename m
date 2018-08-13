From: Florian Weimer <fweimer@redhat.com>
Subject: Are ut_user and ut_host in struct utmp NUL-terminated?
Date: Mon, 13 Aug 2018 14:10:52 +0200
Message-ID: <11742781-3872-5bbf-55d6-8ce597f21e53@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-95181-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: GNU C Library <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Can ut_user be exactly UT_NAMESIZE bytes long?  Or is it necessary to 
set aside a byte with the NUL terminator?

I'm not sure what POSIX says about struct utmpx.  It never says “string” 
in the context of ut_user, so I don't think it clarifies this matter.

Thanks,
Florian

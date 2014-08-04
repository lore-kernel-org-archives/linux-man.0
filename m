From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Reminder: Document _BSD_SOURCE and _SVID_SOURCE transition to _DEFAULT_SOURCE.
Date: Mon, 04 Aug 2014 11:05:22 -0400
Message-ID: <53DFA132.4090606@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-52061-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Michael,

This is a reminder so we all don't forget that _BSD_SOURCE
and _SVID_SOURCE are transitioning to _DEFAULT_SOURCE.

I have documented them here under:

"3.2.2. Deprecation of _BSD_SOURCE and _SVID_SOURCE feature macros"
https://sourceware.org/glibc/wiki/Release/2.20#Packaging_Changes

We should say something in the manual pages about this transition.

If you've got time please feel free to crib any and all of the
text from that section. I wrote it all and I'm contributing it
to the linux kernel man pages project as GPLv2.

Cheers,
Carlos.

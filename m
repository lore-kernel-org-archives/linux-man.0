From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: [patch] posix_fallocate.3: Mention glibc emulation caveats.
Date: Wed, 7 Oct 2015 09:44:54 -0400
Message-ID: <561521D6.50106@redhat.com>
References: <560E0567.7040204@redhat.com> <56123D86.9050601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-63739-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56123D86.9050601@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 10/05/2015 05:06 AM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> On 10/02/2015 05:17 AM, Carlos O'Donell wrote:
>> Michael,
>>
>> You're going to really enjoy reading this patch ;-)
> 
> Thanks for the patch. What a sad story :-{

I've gotten at least one hate mail for documenting how broken
it is when the underlying filesystem doesn't support it ;-)

Florian Weimer (Red Hat) started a rather long and interesting
discussion on libc-alpha about removing the emulation layer,
but we found that it was impossible to do without breaking a
lot of userspace applications that operate over NFS, are
single-threaded, and expect posix_fallocate to work correctly.

The best compromise was to document the behaviour, and wait
for everyone to use NFS 4.2, at which point the issue goes
away. Until then we need to help users cope.

The worst case scenario would be that we remove the fallback
and all the downstream users start implementing their own
incorrect and poorly tested fallback. One fallback
in one project, reviewed by a dozen people is sane.

> Thanks. I've applied. I tweaked the wording a bit in a further
> commit, and then made a further commit where I tried to fine tune
> the  technical details a little. Could you please check commit
> 624fbe44d9c1ef54eb3fd36328f59a5037b87986 and let me know if there
> ia any technical misstep there?

Looks perfect. The goal is to scare you into reviewing your code ;-)

Cheers,
Carlos.

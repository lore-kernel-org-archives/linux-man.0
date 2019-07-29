From: Carlos O'Donell <carlos@redhat.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Mon, 29 Jul 2019 15:27:51 -0400
Message-ID: <0e64d428-9293-33d3-85d6-0440452bf075@redhat.com>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
 <8736liit24.fsf@oldenburg2.str.redhat.com>
 <20190513141746.mail6ny43wh4t5oj@localhost.localdomain>
 <87y335m6fq.fsf@oldenburg2.str.redhat.com>
 <20190517155057.vr5uk6hfkyp44y3t@localhost.localdomain>
 <CAEMqeSrCMFZ8GQU=kR_+KXaqnd9m-3qUSQk1PNZ2xHjZ_YVHFg@mail.gmail.com>
 <3f28f3b3-8fde-2bfb-51bc-6958511ee666@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-104025-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <3f28f3b3-8fde-2bfb-51bc-6958511ee666@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>, linux-man <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 7/29/19 3:18 PM, Michael Kerrisk (man-pages) wrote:
> On 5/17/19 5:56 PM, Carlos O'Donell wrote:
>> On Fri, May 17, 2019 at 11:51 AM G. Branden Robinson
>> <g.branden.robinson@gmail.com> wrote:
>>> What would you prefer?  That the man page not document the bug at all?
>>> Was it a mistake in your view to have added the information about the
>>> bug to the man page in the first place?
>>
>> I think having the glibc upstream version information is useful.
> 
> And so do I. My compromise in such cases is to write something like:
> this:
> 
> BUGS
>         From  glibc  2.19 to 2.29, pldd was broken: it just hung when exe‐
>         cuted.  This problem was fixed in glibc 2.30, and the fix has been
>         backported to earlier glibc versions in some distributions.
> 
> Thanks,

Thank you for being accurate and informative.

-- 
Cheers,
Carlos.

From: Nicholas Miell <nmiell@gmail.com>
Subject: Re: For review: nptl(7) man page
Date: Sun, 22 Mar 2015 14:38:03 -0700
Message-ID: <550F363B.801@gmail.com>
References: <550ED3F4.1080403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-58109-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <550ED3F4.1080403@gmail.com>
To: libc-alpha@sourceware.org
Cc: linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 03/22/2015 07:38 AM, Michael Kerrisk (man-pages) wrote:
> Hello all,
>
> I wrote a short man page documented some of the details of
> NPTL that might affect application developers. Review comments
> would be most welcome.
>
> Thanks,
>
> Michael

POSIX specifies that process-shared pthread_mutex_t's can be manipulated 
by independent processes, however the AMD64 and i386 versions of the 
mutex structures are incompatible and cannot be shared.

This might be true of the other supposedly sharable primitives, I never 
bothered to check the rest when I first noticed the problem with mutexes.

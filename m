From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Revised keyrings(7) man page for review
Date: Wed, 14 Dec 2016 08:27:22 +0100
Message-ID: <2dea8ec1-0b1a-3d1e-da10-653a5d2f0838@gmail.com>
References: <a5615075-dd39-e206-cbce-385bed72473f@gmail.com>
 <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw@mail.gmail.com>
 <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <25262.1481628931@warthog.procyon.org.uk>
 <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
 <26913.1481636296@warthog.procyon.org.uk>
 <30566.1481638837@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30566.1481638837@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: mtk.manpages@gmail.com, lkml <linux-kernel@vger.kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>, keyrings@vger.kernel.org, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/13/2016 03:20 PM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:
> 
>>               The payload data may  be  stored  in  a  tmpfs  filesystem,
>>               rather  than in kernel memory, if the data size exceeds the
>>               overhead of storing the data in the  filesystem.   (Storing
>>               the  data in a filesystem requires filesystem structures to
>>               be allocated in the kernel.  The size of  these  structures
>>               determines the size threshold above which the tmpfs storage
>>               method is used.)  Since Linux  4.8,  the  payload  data  is
>>               encrypted when stored in tmpfs, to prevent it being written
>>               unencrypted into swap space.
> 
> "... thereby preventing it from being written unencrypted into the swapspace"?

Fixed.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

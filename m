From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Rewording language in mbind(2) to "threads" not "processes"
Date: Sat, 22 Oct 2016 12:08:59 +0200
Message-ID: <f1390356-5b8a-9b8f-e426-ad820b484af1@gmail.com>
References: <f3c4ca9d-a880-5244-e06e-db4725e4d945@gmail.com>
 <alpine.DEB.2.20.1610131314020.3176@east.gentwo.org>
 <CAKgNAkiMo-AMZ2PUm3A8NqfiNa+GOnRFn4NrFwjRJa8Z7xNsPw@mail.gmail.com>
 <67165fae-b965-eb34-ecf5-4247acaecee1@gmail.com>
 <alpine.DEB.2.20.1610210844120.24973@east.gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.20.1610210844120.24973@east.gentwo.org>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>
Cc: mtk.manpages@gmail.com, Piotr Kwapulinski <kwapulinski.piotr@gmail.com>, mhocko@kernel.org, mgorman@techsingularity.net, Peter Zijlstra <a.p.zijlstra@chello.nl>, Rik van Riel <riel@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Brice Goglin <Brice.Goglin@inria.fr>
List-Id: linux-man@vger.kernel.org

On 10/21/2016 03:44 PM, Christoph Lameter wrote:
> On Fri, 21 Oct 2016, Michael Kerrisk (man-pages) wrote:
> 
>> Did you have any thoughts on my follow-on question below?
> 
> There was only one AFAICT?
> 
>>> Thanks. So, are all the other cases where I changed "process" to
>>> "thread" okay then?
> 
>>From what I see yes.
> 
> 

Thanks, Christoph. I've added a Reviewed-by from you.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

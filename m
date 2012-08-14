From: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: proc(5): minor text updates
Date: Tue, 14 Aug 2012 19:53:45 +0200
Message-ID: <502A90A9.1030100@googlemail.com>
References: <50202153.6030808@googlemail.com> <CAKgNAkhrmpZuF45iOA52akABSm4hUy4ygR=vEg4XQ_4Ri7DjRw@mail.gmail.com> <502935C1.60901@googlemail.com> <CAKgNAkh_PxqPy+jK0t6WG54KQXOkm2JBTDw69qEtqOsaeTVGAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh_PxqPy+jK0t6WG54KQXOkm2JBTDw69qEtqOsaeTVGAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

On 08/13/12 22:41, Michael Kerrisk (man-pages) wrote:
> Ahh -- yes, an easy mistake to make I think. The thing is there are two
> unrelated sets of constants in the PF_* namespace. Take a look in 
> linux/sched.h to see the other set, which is (AFAICS) the set that is used
> in this /proc file.

Which other set of PF_ constants in <linux/sched.h> ? I only see SCHED_* and
CLONE_* defined in that file. Aside from protocol family PF_* flags, there is
only <linux/elf.h> defining permission flags (PF_R/W/X), which seems unlikely
to me.

Best regards
Tolga Dalman


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

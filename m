From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Wed, 23 Apr 2014 08:06:42 +0200
Message-ID: <53575872.6080403@gmail.com>
References: <1398182519.2926.26.camel@x201> <5356B3BA.7050401@gmail.com>	 <CA+FuTSc=4fwH=+jX58teeQHrRse718qLBOLzAcrZJSYug2TfSw@mail.gmail.com>	 <5356BB3F.4030502@gmail.com>	 <CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com> <1398200019.5031.24.camel@actium.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398200019.5031.24.camel-FQO4gtnRtnzkVFMGpb/cPg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/22/2014 10:53 PM, Carsten Andrich wrote:
> @Willem: Sorry for being a smart ass ;)
>> I interpreted this as the tp_status field of the malformed packets. To
>> make clear that it does not refer to the "following packets", it could
>> be revised to
>>
>> "is set, transmission continues, skipping over any malformed packets. The
>> status of the malformed packets is reset to TP_STATUS_AVAILABLE."
> There's no need to emphasize that "only" malformed packets have their
> tp_status set to TP_STATUS_AVAILABLE, since the following packets will
> share that fate (by being either skipped or actually sent).
> If this were not the case the ring would be broken, due to multiple
> non-consecutive occurrences of the same TP_STATUS_xyz. This is why the
> transmission must be immediately aborted on encountering a malformed
> packet if PACKET_LOSS is not set.
> 
> Aside from this purely academical know-it-all remark (sorry, again),
> your suggested change is fine, of course. As an alternative, I simply
> stripped the "theirs" from my initial suggestion:
> ---
> However if
> .BR PACKET_LOSS
> is set, any malformed packet will be skipped, its status reset to
> .BR TP_STATUS_AVAILABLE
> and the transmission process continued.
> ---

How would adding just a little more precision be:

[[
However, if
.BR PACKET_LOSS
is set, any malformed packet will be skipped, its status 
.RI ( tp_status
in the
.I tpacket_hdr
structure) reset to
.BR TP_STATUS_AVAILABLE ,
and the transmission process continued.
]]

?

Cheers,

Michael

> -------- Weitergeleitete Nachricht --------
> Von: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> An: Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Kopie: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, Daniel Borkmann
> <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Betreff: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
> Datum: Tue, 22 Apr 2014 15:14:53 -0400
> 
> On Tue, Apr 22, 2014 at 2:55 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [...]
>> @Carsten: I've applied your patch, but I have a question. You wrote:
>>
>> [[
>> However if
>> .BR PACKET_LOSS
>> is set, malformed packets will be skipped, their status reset to
>> .BR TP_STATUS_AVAILABLE
>> ]]
>>
>> What does "their" in "their status" refer to?
> 
> I interpreted this as the tp_status field of the malformed packets. To
> make clear that it does not refer to the "following packets", it could
> be revised to
> 
> "is set, transmission continues, skipping over any malformed packets. The
> status of the malformed packets is reset to TP_STATUS_AVAILABLE."
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

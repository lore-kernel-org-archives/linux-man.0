From: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Subject: Re: [manpages]: First stab at a udplite(7) manpage
Date: Fri, 18 Jul 2008 12:09:23 +0100
Message-ID: <20080718110923.GA12919@gerrit.erg.abdn.ac.uk>
References: <200806172228.06801.tomasz@grobelny.oswiecenia.net> <Pine.LNX.4.64.0806171344370.25191@shark.he.net> <cfd18e0f0806180207x783d83d0j3d5e42987be24ea6@mail.gmail.com> <20080618092707.GC23684@gerrit.erg.abdn.ac.uk> <cfd18e0f0806180248g35bec32n7977c46cbcf4142@mail.gmail.com> <20080624133625.GA16424@gerrit.erg.abdn.ac.uk> <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com> <20080630112751.GB5040@gerrit.erg.abdn.ac.uk> <cfd18e0f0806300603g38cc4222r37996404390dfcbf@mail.gmail.com> <cfd18e0f0807160810p7d40e3bbpe150d695aca8c5ea@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0807160810p7d40e3bbpe150d695aca8c5ea-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Quoting Michael Kerrisk:
| Hi Gerrit,
| 
| [...]
| 
| >> Will submit a bug-fix to netdev and resubmit the updated manpage when this
| >> issue has been resolved.
| 
| Where are we with udplite.7 then?
| 
Not forgotten. Patch was submitted to netdev@vger on Monday 30th June, which 
tried to handle the illegal values consistently, i.e. return EINVAL for
 * values between 1..7 (illegal as per RFC 3828, 3.1);
 * values greater than 65535 (since IPv6 jumbograms are not supported as
   per RFC 3828, 3.5 and since the u16 value internally wraps around to 1..7).

The reply came back on Sat 5 July asking not to return EINVAL in the first case.

I haven't submitted a new patch so far since I was asking for input regarding 
these cases. Maybe someone has a good suggestion regarding this?

I will either re-post this on netdev very soon or work on a new patch.
But can't submit manpage while the API is still not clear.

Copy of email posted to netdev on Mon 7 July:
> Can I just clarify illegal checksum values, as there are two different cases:
> 
>  (a) Values between 1..7 
>      The specification marks these as illegal in RFC 3828, sec. 3.1.
>      The Linux UDP-Lite API allowed the user to get away with these illegal 
>      coverage values and documented this fact in udplite.txt. Since I am guilty
>      of having written this file, I can add that I am not aware that the same 
>      behaviour is specified in another place -- other than RFC 3828.
> 
>  (b) Values greater than 0xFFFF
>      The UDP-Lite checksum coverage field has the same u16 size as the
>      UDP Length field but, in contrast, IPv6 jumbograms are not supported
>      (RFC 3828, 3.5). This means that checksum coverage values greater than
>      65535 are undefined. 
>      Since the internal field is u16 and since the setsockopt() argument
>      is `int', there is a need to protect against this range, not only 
>      since the wrap-around can again cause values in the range 1..7.
>        
> Can you and/or other people please provide input what to do API-wise in
> the two above cases, since this information is needed for the manpage also?
> 
> These options come to mind:
> 
>   (1) Keep behaviour for (a), return EINVAL for (b).
>   (2) Keep behaviour for (a) and silently ignore values > 0xffff by
>       replacing these with "full coverage" (0) - problematic if 
>       negative values were supplied.
>   (3) Return EINVAL in both cases (as sketched by the patch).
>   (4) Other alternative?

Regards
Gerrit
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

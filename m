From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [manpages]: Version 2 of a udplite(7) manpage
Date: Thu, 07 Aug 2008 15:34:09 +0200
Message-ID: <489AF9D1.4010403@gmail.com>
References: <Pine.LNX.4.64.0806171344370.25191@shark.he.net> <cfd18e0f0806180207x783d83d0j3d5e42987be24ea6@mail.gmail.com> <20080618092707.GC23684@gerrit.erg.abdn.ac.uk> <cfd18e0f0806180248g35bec32n7977c46cbcf4142@mail.gmail.com> <20080624133625.GA16424@gerrit.erg.abdn.ac.uk> <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com> <20080630112751.GB5040@gerrit.erg.abdn.ac.uk> <cfd18e0f0806300603g38cc4222r37996404390dfcbf@mail.gmail.com> <cfd18e0f0807160810p7d40e3bbpe150d695aca8c5ea@mail.gmail.com> <20080718110923.GA12919@gerrit.erg.abdn.ac.uk> <20080723154017.GA14244@gerrit.erg.abdn.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080723154017.GA14244-w6qhtmnlW2CgJ32XgR7WtTYRy0cijUJx@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gerrit,

Gerrit Renker wrote:
> Michael,
> 
> can you please have a look at the revised version of the udplite(7) manpage?
> 
> The main changes are:
>  * the patch correcting the behaviour for large checksum coverages (> 0xffff)
>    has been accepted by Dave Miller into the netdev-2.6 tree and pushed to -stable;
>  * this behaviour has been documented (truncation to maximum value);

Okay.

>  * also attached is an rcsdiff where the responses to your Fixme's are good to see;

Thanks for that -- much easier to see what you did in response to my comments.

>  * the rest is minor editorial changes.

Yep.

Thanks for this revision.  I made one or two small edits.  The most notable
is that I changed PF_INET to AF_INET in the SYNOPSIS.  (As fas as POSIX.1
is concerned, the PF_* constants are obsolete, in favour of the AF_*
constants with the same value.)  I think we're good to go otherwise, and
I'll include this page in man-pages-3.07, unless you think some further work
still needs to be done.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

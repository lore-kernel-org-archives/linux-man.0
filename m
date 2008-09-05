From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: networks.5 man page
Date: Fri, 5 Sep 2008 08:18:09 +0200
Message-ID: <cfd18e0f0809042318w25398e00n9772dfed69fbef0c@mail.gmail.com>
References: <48BD0587.4080803@gmail.com>
	 <20080902115633.GK1145@finlandia.home.infodrom.org>
	 <cfd18e0f0809020504v26c9b61bu6ad45ce56d5d5be6@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0809020504v26c9b61bu6ad45ce56d5d5be6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Sep 2, 2008 at 2:04 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Tue, Sep 2, 2008 at 4:56 AM, Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org> wrote:
>> Michael Kerrisk wrote:
>>> Hi Joey,
>>>
>>> I see that Debian downstream has a networks(5) page (below) that you
>>> wrote some years back (before my time as maintainer).  It seems
>>> to me that it might make sense to take this page upstream.
>>> What do you think?
>>
>> Great!  I'd appreciate this!
>
> And your thoughts on this piece?
>
> [[
> PS The FreeBSD networks(5) page has some details not in your page
> http://www.freebsd.org/cgi/man.cgi?query=networks&apropos=0&sektion=0&manpath=FreeBSD+7.0-RELEASE&format=html
> Perhaps some of those details might also be usefully
> covered in your page?
> ]]

Hi Joey,

After reviewing the FreeBSD page, and doing a little testing, I
made a few edits to the Debian downstream networks(5) page
and have included it for man-pages-3.09.

Could you please review the diff below?  The most notable
change is the substitution of "dotted-decimal" by "numbers-and-dots"
notation, since getnetent(3) etc. do indeed accept that more
general form, according to my tests.

Cheers,

Michael

--- networks.5.orig     2008-09-04 15:52:03.000000000 +0200
+++ networks.5  2008-09-04 15:51:13.000000000 +0200
@@ -19,8 +19,9 @@
 .\" License along with this manual; if not, write to the Free
 .\" Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139,
 .\" USA.
+.\" 2008-09-04, mtk, taken from Debian downstream, with a few light edits
 .\"
-.TH NETWORKS 5 2001-12-22 "GNU/Linux" "Linux System Administration"
+.TH NETWORKS 5 2008-09-04 "GNU/Linux" "Linux System Administration"
 .SH NAME
 networks \- network name information
 .SH DESCRIPTION
@@ -36,27 +37,32 @@

 where the fields are delimited by spaces or tabs.
 Empty lines are ignored.
-If a line contains a hash mark (#), the hash mark and the remaining
-part of the line are ignored.
+The hash character (\fB#\fP) indicates the start of a comment:
+this character, and the remaining characters up to
+the end of the current line,
+are ignored by library functions that process the file.

 The field descriptions are:

 .TP
 .I name
 The symbolic name for the network.
+Network names can contain any printable characters execept
+white-space characters or the comment character.
 .TP
 .I number
-The official number for this network in dotted-decimal notation.
-The trailing ".0" may be omitted.
+The official number for this network in numbers-and-dots notation (see
+.BR inet (3)).
+The trailing ".0" (for the host component of the network address) may
be omitted.
 .TP
 .I aliases
 Optional aliases for the network.
 .LP

-This file is read by
-.B route
-or
-.B netstat
+This file is read by the
+.BR route (8)
+and
+.BR netstat (8)
 utilities.
 Only Class A, B or C networks are supported, partitioned networks
 (i.e. network/26 or network/28) are not supported by this facility.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Fri, 13 Apr 2012 21:47:49 +0100
Message-ID: <4F8890F5.8070502@proseconsulting.co.uk>
References: <51634.1318537560@proseconsulting.co.uk> <CAKgNAkjAsWSiZEhFqnhFQDiFzLxcPzHQ1OweZswtB4q-fRf-ig@mail.gmail.com> <4F74CFDC.10802@proseconsulting.co.uk> <CAKgNAkjddHc9_snmdiEucEnVFEwVVz2JxijdNncATTKROgzbqQ@mail.gmail.com> <042c392d-fe53-49e9-99e5-84737f1ca2f4@email.android.com> <CAKgNAkjMW84RhN7tnDzb-hr8dWbK7ZWEge-roWHHJUay_D2uBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjMW84RhN7tnDzb-hr8dWbK7ZWEge-roWHHJUay_D2uBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 30/03/2012 10:50, Michael Kerrisk (man-pages) wrote:
> Hi Mark,
>
> On Fri, Mar 30, 2012 at 10:28 PM, Mark R Bannister
> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>  wrote:
>>>>> Thanks Mark. This looks good. I've done some light edits. Could you
>>>>> please review the below (also attached).
>>>>
>>>> Hi Michael,
>>>>
>>>> I've reviewed your edits. They're almost all good, but I've had to counter
>>>> some of your light edits. Latest version below and attached.
>>> Hi Mark,
>>> Can you explain your changes? It looks like they mostly revert my additions of commas and formatting consistency with other pages.
>>> Why?
>>> Thanks, Michael
>> Hi Michael,
>>
>> It's hard to know what exactly we're talking about here because your
>> light edits were not supplied in a way that could easily be reviewed.
>> In fact, I had to diff the two to find out what you had edited.
> I understand what you mean. The problem is that while  the edits were
> light, they touched a lot of lines (adding commas, changing formatting
> to be consistent with other man pages, modifying a few wordings,
> reordering some text, rewrapping some source lines), and so the diff
> was nearly as long as the page itself. So, it seemed simplest just to
> give you the revised page, and allow you to read it fresh.
>
>> I suggest the best approach is for you to apply my original patch
>> unedited, then submit to this list a new patch with your suggested
>> edits.  Then it will be easier for us to discuss which edits I didn't
>> believe were correct or necessary, and others would also
>> have transparency and be able to comment if they wished too.
> Okay.
>
> Regarding addition of commas, changes of formatting, and so on, keep
> this in mind: my "big picture" is to try to have some consistency
> across man pages. You might have different ideas on some points, but
> I'm very interested in consistency across pages (and I do have quite a
> lot of experience of coy-editing and being copy-edited).

Hi Michael,

Sorry for the delay in replying.  Thanks for sending the patch, my 
comments are in-line below.

>
> Patch below.
>
> Cheers,
>
> Michael
>
> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index 6a2a82e..83cc5f8 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -18,31 +18,30 @@
>   .\"
>   .\" You should have received a copy of the GNU General Public
>   .\" License along with this manual; if not, write to the Free
> -.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
> -.\" USA.
> +.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> +.\" MA 02111, USA.

np

>   .\"
> -.TH NSSWITCH.CONF 5 2011-10-13 "Linux" "Linux Programmer's Manual"
> +.TH NSSWITCH.CONF 5 2012-03-29 "Linux" "Linux Programmer's Manual"

np

>   .SH NAME
>   nsswitch.conf \- Name Service Switch configuration file
>   .SH DESCRIPTION
>   The
>   .I /etc/nsswitch.conf
> -file is a configuration file used by the GNU C Library to determine from
> -what sources to obtain name service information in a range of categories,
> +("Name Server Switch", NSS)

Unnecessary, not good grammar and incorrect to insert this text in 
parentheses.  Unnecessary because we mention it in the NOTES section 
below, not good grammar on several counts not least of which because it 
interrupts the fluency of the sentence, and incorrect because NSS stands 
for "Name Service Switch" not "Name Server Switch", nor "Names Server 
Switch" as you have it later on.  As I also mention later on, I'm not a 
big fan of using parentheses in the middle of sentences, especially when 
a perfectly good sentence can be constructed without.  This isn't a 
shell script.

> +file is a configuration file used by the GNU C Library to determine
> +the sources from which to obtain name-service information in

np except that "name service" does not need hyphenation.  We don't 
hyphenate it anywhere else in the page, so don't need to here.

> +a range of categories,
>   and in what order.
>   Each category of information is identified by a database name.
>   .LP
>   The file is plain ASCII text, with columns separated by spaces or tab
>   characters.
> -The first column defines the database name.
> +The first column specifies the database name.

np

>   The remaining columns describe the order of sources to query and a
> -limited
> -set of actions that can be performed by lookup result.

np

> +limited set of actions that can be performed by lookup result.
>   .LP
> -The following databases are made available by the standard
> -GNU C Library:
> -.RS 3
> -.TP 10
> +The following databases are understood by the GNU C Library:
> +.TP 12

The way you format tables and lists, left flush with no indentation, is 
not easy to read.  I prefer all my lists to be indented, which makes the 
page easier to read.  If any list is going to be indented, they all 
should be, and to the same level.  So this comment applies to all your 
RS, TP and RE changes below as well.

>   .B aliases
>   Mail aliases, used by
>   .BR getaliasent (3)
> @@ -62,8 +61,8 @@ Host names and numbers, used by
>   and related functions.
>   .TP
>   .B netgroup
> -Network wide list of hosts and users, used for access rules.
> -C libraries before glibc 2.1 only supported netgroups over NIS.
> +Network-wide list of hosts and users, used for access rules.
> +C libraries before glibc 2.1 supported netgroups only over NIS.

np

>   .TP
>   .B networks
>   Network names and numbers, used by
> @@ -97,13 +96,12 @@ and related functions.
>   Shadow user passwords, used by
>   .BR getspnam (3)
>   and related functions.
> -.RE
>   .LP
>   Here is an example
>   .I /etc/nsswitch.conf
>   file:
>   .LP
> -.RS 3
> +.RS 4
>   .PD 0
>   .TP 16
>   passwd:
> @@ -138,16 +136,13 @@ nis [NOTFOUND=return] files
>   .LP
>   The first column is the database name.
>   The remaining columns specify:
> -.RS 3
> -.TP 3
> -o
> -One or more service specifications e.g. "files", "db", or "nis".
> -The order the services appear on the line determine the order in which
> +.IP * 3
> +One or more service specifications e.g., "files", "db", or "nis".
> +The order of the services on the line determines the order in which

np

>   those services will be queried, in turn, until a result is found.
> -.TP
> -o
> +.IP *
>   Optional actions to perform if a particular result is obtained
> -from the preceding service, e.g. "[NOTFOUND=return]".
> +from the preceding service, e.g., "[NOTFOUND=return]".

A comma after a dot is redundant.  This applies to all cases where you 
have changed "e.g." to "e.g.,".  Mind you, a little research revealed: 
http://dictionary.reference.com/help/faq/language/g58.html which I had 
not previously been aware of.

I write British English.

>   .RE
>   .LP
>   The service specifications supported on your system depend on the
> @@ -158,8 +153,15 @@ will provide the named
>   .IR SERVICE .
>   On a standard installation, you can use
>   "files", "db", "nis", and "nisplus".
> -For the hosts database, you can additionally specify "dns".
> -For the passwd, group, and shadow databases, you can additionally specify
> +For the
> +.B hosts
> +database, you can additionally specify "dns".
> +For the
> +.BR passwd ,
> +.BR group ,
> +and
> +.BR shadow
> +databases, you can additionally specify

np

>   "compat" (see
>   .B "Compatibility mode"
>   below).
> @@ -169,28 +171,20 @@ may be 1 for glibc 2.0, or 2 for glibc 2.1 and later.
>   On systems with additional libraries installed, you may have access to
>   further services such as "hesiod", "ldap", "winbind" and "wins".
>   .LP
> -An action may also be specified following a service specification, that
> -modifies behaviour following a result obtained from the preceding data
> -source.
> +An action may also be specified following a service specification.
> +The action modifies the behaviour following a result obtained
> +from the preceding data source.

np

>   Action items take the general form:

>   .LP
> -.RS 3
> -[
> -.I STATUS
> -=
> -.I ACTION
> -]
> +.RS 4
> +.RI [ STATUS = ACTION ]

np

>   .br
> -[ !
> -.I STATUS
> -=
> -.I ACTION
> -]
> +.RI [! STATUS = ACTION ]

np

>   .RE
>   .LP
>   where
>   .LP
> -.RS 3
> +.RS 4
>   .I STATUS
>   =>
>   .B success
> @@ -210,14 +204,14 @@ where
>   .LP
>   The ! negates the test, matching all possible results except the
>   one specified.
> -The case of the keywords is insignificant.
> +The case of the keywords is not significant.

np

>   .LP
>   The
>   .I STATUS
>   value is matched against the result of the lookup function called by
>   the preceding service specification, and can be one of:
> -.RS 3
> -.TP 10
> +.RS 4
> +.TP 12
>   .B success
>   No error occurred and the requested entry is returned.
>   The default action for this condition is "return".
> @@ -228,8 +222,8 @@ The default action for this condition is "continue".
>   .TP
>   .B unavail
>   The service is permanently unavailable.
> -This can either mean the
> -required file cannot be read, or, for network services, the server
> +This can mean either that the
> +required file cannot be read, or, for network services, that the server

np

>   is not available or does not allow queries.
>   The default action for this condition is "continue".
>   .TP
> @@ -243,8 +237,8 @@ The default action for this condition is "continue".
>   The
>   .I ACTION
>   value can be one of:
> -.RS 3
> -.TP 10
> +.RS 4
> +.TP 12
>   .B return
>   Return a result now.
>   Do not call any further lookup functions.
> @@ -258,7 +252,7 @@ additionally permits special entries in
>   .I /etc/passwd
>   for granting users or members of netgroups access to the system.
>   The following entries are valid in this mode:
> -.RS 3
> +.RS 4
>   .TP 12
>   .BI + user
>   Include the specified
> @@ -279,14 +273,14 @@ Exclude all users in the given
>   .IR netgroup .
>   .TP
>   .B +
> -Include every user, except previously excluded ones, in the
> +Include every user, except previously excluded ones, from the

np

>   NIS passwd map.
>   .RE
>   .LP
>   By default the source is "nis", but this may be
> -overridden by specifying "nisplus" as source for the pseudo-databases
> +overridden by specifying "nisplus" as the source for the pseudo-databases

np

>   .BR passwd_compat ,
> -.B group_compat
> +.BR group_compat ,

A comma before "and" is generally not good grammar unless the sentence 
is complex and the extra pauses help the reader.  In this case the 
sentence is short and the comma you've inserted adds no extra clarity.

>   and
>   .BR shadow_compat .
>   .SH FILES
> @@ -296,7 +290,7 @@ is implemented by a shared object library named
>   .IB libnss_SERVICE.so. X
>   that resides in
>   .IR /lib .
> -.RS 3
> +.RS 4
>   .TP 25
>   .PD 0
>   .I /etc/nsswitch.conf
> @@ -324,9 +318,6 @@ implements "nis" source.
>   implements "nisplus" source.
>   .PD
>   .RE
> -.SH SEE ALSO
> -.BR getent (1),
> -.BR nss (5).
>   .SH NOTES
>   Within each process that uses
>   .BR nsswitch.conf ,
> @@ -334,16 +325,17 @@ the entire file is read only once.
>   If the file is later changed, the
>   process will continue using the old configuration.
>   .LP
> -Traditionally there was only a single source for service information,
> +Traditionally, there was only a single source for service information,

Redundant comma.

>   often in the form of a single configuration
> -file (e.g. \fI/etc/passwd\fP).
> -However, as other nameservices, like the Network Information
> +file (e.g., \fI/etc/passwd\fP).

E.g. discussion above.

> +However, as other name services, such as the Network Information

np

>   Service (NIS) and the Domain Name Service (DNS), became popular,
>   a method was needed
>   that would be more flexible than fixed search orders coded into
>   the C library.
> -.LP
> -The Linux libc5 with NYS support and the GNU C Library 2.x (libc.so.6)
> -introduced a cleaner solution to the problem, based on the
> -.B "Name Service Switch"
> -mechanism used by Sun Microsystems in the Solaris 2 C library.
> +The Names Server Switch mechanism

"Name Service Switch" is correct.  "Names Server Switch" is incorrect.

> +(based on the mechanism used by Sun Microsystems in the Solaris 2 C library)

I don't like the use of parentheses.  If one can write a good sentence 
without using them, more the better.  So editing a sentence that didn't 
need to use parentheses, and adding them in, is not going to get my vote.

> +introduced a cleaner solution to the problem.
> +.SH SEE ALSO
> +.BR getent (1),
> +.BR nss (5)
>
>

np moving SEE ALSO to end.

I hope you understand now which edits I had no problem with.  A large 
number of your edits were not controversial and I agree with.  You can 
now see the handful of edits that I disagreed with.

Best regards,
Mark.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

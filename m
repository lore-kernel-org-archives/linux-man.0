From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf(5): document notes
Date: Sat, 19 Nov 2016 11:13:12 +0100
Message-ID: <CAKgNAkgqWayEyq5iej=+2y+uyD9BsLNDNHhAC539L955aet56w@mail.gmail.com>
References: <20161117205939.2295-1-vapier@gentoo.org> <2dbf5664-524e-9411-16f4-2a84e6395c82@gmail.com>
 <20161118182547.GY21655@vapier.lan>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118182547.GY21655-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 18 November 2016 at 19:25, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 18 Nov 2016 08:25, Michael Kerrisk (man-pages) wrote:
>> On 11/17/2016 09:59 PM, Mike Frysinger wrote:
>> > for documenting the Elf{32,64}_Nhdr structure,
>> > the sections/segments that contain notes, and how to interpret them.  I've
>> > been lazy and only included the GNU extensions here,
>>
>> Any chance you include the non-GNU stuff also? Or, failing that,
>> some clear statements at appropriate points about what is not
>> documented.
>
> the trouble i was running into is that the man pages says it documents
> the elf.h header, but the one installed by glibc doesn't have defines
> for all the non-GNU stuff.  so if i put in details about the FreeBSD
> namespace, it'll have defines like NT_FREEBSD_THRMISC.  none of those
> show up in the current elf.h though so people will get errors.
>
> i'm fine with that though if you are.

Actually, it sounds like your original approach is best then.

>> > +Note sections contain a series of notes (see the structs below).
>> > +Each note is followed by the name field (whose length is defined in
>> > +\fIn_namesz\fR) and then by the desc field (whose length is defined in
>> > +\fIn_descsz\fR).
>>
>> I think this could be a little clearer. I presume that the way things look is
>>
>>      struct {} Nhdr
>>      <name>\0
>>      <desc>\0
>>
>> ?
>
> i don't think desc is NUL terminated, but otherwise, yes.
>
>> Maybe shos something like that in the text?
>
> i couldn't find any precedent to copy :).  i didn't want to put it into
> the struct def since those fields aren't in the struct, they're implicit
> in memory.
>
> how about i put a small snippet of C that'd show how to extract things ?
>
>         void *memory, *name, *desc;
>         Elf64_Nhdr *note, *next_note;
>
>         note = memory;
>         name = note->n_namesz == 0 ? NULL : memory + sizeof(*note);
>         desc = note->n_descsz == 0 ? NULL : name + note->n_namesz;
>         next_note = memory + sizeof(*note) + note->n_namesz + note->n_descsz;

Yes, that's better than my idea.

>> > +Keep in mind that the interpretation of
>> > +.I n_type
>> > +depends on the namespace defined by the
>> > +.I n_namesz
>> > +field.
>> > +After, of course, whether the ELF image has been determined to be a core.
>>
>> I can't understand that last sentence...
>
> i meant that the namespaces are for non-core files, but i'll double check
> that is the case.

Just to be clear, the reason I could not understand that sentence was
that there appear to be some words missing.

> i snipped all the comments that i'll integrate so i don't have to just
> keep saying "OK" over and over :).

OK.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

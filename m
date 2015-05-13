From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: /proc/{diskstats,schedstat,vmstat} documentation
Date: Wed, 13 May 2015 17:08:49 +0200
Message-ID: <CAKgNAkgdApFVnhG_Rt-Mor2KhBF5bceqaDH1YMtpe68Lm4ydKQ@mail.gmail.com>
References: <55531E5F.2090803@redhat.com> <55534B8B.8010400@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55534B8B.8010400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 13 May 2015 at 15:03, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Marko,
>
> On 05/13/2015 11:50 AM, Marko Myllynen wrote:
>> Hi Michael,
>>
>> it seems that /proc/vmstat is undocumented in proc(5), is it just
>> because nobody has written the documentation yet or are some files
>> considered out of scope for proc(5)? Other such "interesting" file which
>> would be nice to have documented in-line is IMHO /proc/diskstats.
>
> It's just because no one has taken the time... There are in fact many holes
> in proc(5) :-(.
>
>> FWIW, for /proc/vmstat first search hit is
>> http://www.linuxinsight.com/proc_vmstat.html which looks decent.
>
> Well, it has some of the needed info, but there's many more entries in
> the file than are listed there.
>
>> I also see that /proc/schedstat and /proc/<pid>/schedstat are missing,
>> some information about them can be found at
>> http://eaglet.rain.com/rick/linux/schedstat/v15/format-15.html and
>> https://www.kernel.org/doc/Documentation/scheduler/sched-stats.txt.
>>
>> Lastly, /proc/<pid>/{loginuid,sessionid} are missing.
>>
>> PS. Yes, I think I try to provide patches at least for a couple of these
>> cases if time permits.
>
> That would be great.

So, in case you decide to pursue this, here's a little script I
whipped up that tells you about version changes in /proc/vmstat since
Linux 2.6.12 (git start).

Clone yourself a fresh git tree; chdir into the tree, and run the script.

Knowing the kernel version umber then let's you find the corresponding
commit more easily, and there for each file you might find some info
in the commit message explaining what the file is about.

Cheers,

Michael

#! /bin/sh
# Generate a history /proc/vmstat changes
#
# 1. Clone a fresh "linux" git repo
# 2. chdir to the root directory
# 3. Run this script
#
lfunc() {
FILE=$(git grep -l vmstat_text $1)
cat $FILE | sed '1,/^[cs].*vmstat_text/d' | sed '/^}/,$d' |
        sed 's%\/\*.*\*\/%%' | sed '/^[         ]*$/d' | sed 's/[",]//g' |
        awk '
                {
                    if ($1 == "#ifdef") {
                        lname[lev] = $2
                        lev++;
                    } else if ($1 == "#endif") {
                        lev--;
                    } else {
                        printf "%s", $0
                        for (l = 0; l < lev; l++)
                            printf "\t%s", lname[l]
                        print ""
                    }

                }
        ' | sed 's/^[   ]*//'

}

VERSIONS=$(git tag -l|grep -v -- '-'|grep '^v'| grep -v 'v2.6.11')

for v in $VERSIONS; do
     echo "======== $v"
     git checkout -fq $v
     lfunc mm > vmstat-$v;
done

c=0
for v in $VERSIONS; do
        if test $c -gt 0; then
                echo "================ $v"
                diff -u vmstat-$prev vmstat-$v
        fi
        c=$(expr $c + 1)
        prev=$v;
done | less
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

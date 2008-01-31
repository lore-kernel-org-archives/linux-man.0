From: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page bugs?
Date: Thu, 31 Jan 2008 23:11:46 +0800
Message-ID: <20080131151146.GD2471@hacking>
References: <20080119130029.GC2466@hacking> <47A1C58D.9060101@gmail.com> <20080131130202.GT15220@kernel.dk> <47A1CAF1.9090802@gmail.com> <20080131132858.GZ15220@kernel.dk> <20080131143954.GA2471@hacking> <20080131150345.GC15220@kernel.dk>
Reply-To: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080131150345.GC15220-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>> 
>> I think man page should mention about this usage.
>
>Hmm, but it does - you even quoted the EINVAL return documentation
>yourself. The description mentions that it dupes between the pipes
>referred to by fd_in and fd_out. Not sure how much else we can do there?


I meant it should explicitly describe how to use that example. ;)

>
>> >> Hi jens,
>> >> 
>> >> Yes, I guessed you probably should run it like that.  And it does produce
>> >> the expected output on stdout.  However, the command then blocks, and if
>> >> one types control-C, the output_file is empty.  How should this program be
>> >> terminated so that something does end up in the output_file?
>> >
>> >See ktee.c from the splice sample repo, it works correctly:
>> >
>> >axboe@carl:~/git/splice> echo hello | ./ktee outfile | cat
>> >hello
>> >axboe@carl:~/git/splice> cat outfile 
>> >hello
>> >
>> >I don't have the tee(2) man page here so can't verify, but try and
>> >compare them!
>> >
>> 
>> I have the same problem here with what Michael mentioned.
>> But my output file is *not* empty. Shown below:
>> 
>> $ echo hello | ./tee fooo.txt | cat
>> hello
>> 	<=== here blocked, type ctrl+c, exit
>> $ cat fooo.txt 
>> hello
>> 
>> My kernel version is 2.6.21-1.3194.fc7.
>
>I don't know what 'tee' is - is it the one from the man page, or the one
>from my splice tools?

My bad. The file "./tee" is just the output executable of the
given example in tee(2).

Thanks!

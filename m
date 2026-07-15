Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80643F0B6
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141754; cv=none; b=NeqrvJuxLqZJWaEFUjNwmtvmHiBhgVnt+IBAyfaW/Rdik0QvYGw6gQt9xNcuHrFm8j4fWg7WjAtlmfwxAV/33ftufbHyrtQlV7QZbCRslxeURg9cKlN25pieqI8v9KJ3IV1f3q4N5n8vukiZvH61ncNySDZf89KPjtUbK8cFwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141754; c=relaxed/simple;
	bh=9u2JD6s06GJ3jAbRrj0+KhZBb5OekddWXoD4evg49sc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=GLFY5YdEQtMpFiIDE5AGyL3EcMQuwf1u6RMym2jG+rDta3l/iWsJzrvrlxZhZbtWGlD9DnR4tvi/uQuaHn9NwXnEHYKhLFMNdD83IqG25pXl8qnotsoWkOb3PpRfMGsZlRFF1niTYNKdgHbKR9wOgSRwS+tv54c5/VIVzgvw4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XZKUshpC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XZKUshpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784141748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=TfFmIi+OrehdTgnzBGmQ4zvsB8JCK04JACtHL2kZfGQ=;
	b=XZKUshpCZ03bxYGuOod6YouIasvdf2aKLPXb2EX5hqwEsINmiFeNimVcneTygR48FWkNbO
	rD8VID2P01FucdGLmk9bg+nHA9pueNGA806vwb9WTY7KUi/Vyak/fN0xLeqNaGNco+Jf1q
	qrJDR60Ad6QeH2sl1axBfuN/ItdpZHg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-nLdG391qOUui66bs7P4Vrw-1; Wed,
 15 Jul 2026 14:55:45 -0400
X-MC-Unique: nLdG391qOUui66bs7P4Vrw-1
X-Mimecast-MFC-AGG-ID: nLdG391qOUui66bs7P4Vrw_1784141744
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 281EF1956063;
	Wed, 15 Jul 2026 18:55:44 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6C9D1800370;
	Wed, 15 Jul 2026 18:55:43 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66FItfFc1174308;
	Wed, 15 Jul 2026 14:55:42 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <ale2ytaF-sTAyH3W@devuan> (message from Alejandro Colomar on
 Wed, 15 Jul 2026 19:09:16 +0200)
Date: Wed, 15 Jul 2026 14:55:41 -0400
Message-ID: <xno6g86q1e.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alejandro Colomar <alx@kernel.org> writes:
>> Perhaps such a helper could be included in the git repo, just for
>> authors?
>
> I'd be interested in at least having a look at it!  It might have
> something useful.

I'll append it here for posterity.  It's not much.

> BTW, what's the etymology of 'lman', out of curiosity?

"local man page" vs installed man page.

>> What I did was tell Gemini what I was looking for, and it wrote a perl
>> script faster than I could open my editor.  Cut, paste, run, throw it
>> away.  That was just for the statistics, of course.

> I might actually doubt the statistics, though, so a disclaimer of use
> would be appropriate even for statistics,

I did too, and modified the script to show me the uncommon lines so I
could verify it was doing what it was supposed to be doing.

> I would like to avoid another perl script.

Heh ;-)

> That one exists because its author wrote it in perl, and I don't
> understand perl enough to translate it to something I'd understand and
> be able to maintain.

I do, and perl looks like the right choice for that one.  Perhaps in the
future, if it needed maintaining, I could go through and add copious
comments.  For now I'm inclined to just leave it ;-)

> If anyone understands perl enough to translate that into a shell script,
> I'd appreciate it very much.  :)

Perl is just a shell script, for AWK, right?  And AWK is just a shell
script for SED?  <ducks>

>> glibc is the same way, I'm used to that.
>
> Nice to hear that glibc doesn't allow AI!

Well, for legal and technical reasons, not for moral reasons.  The FSF's
stand is similar at the moment - the legal landscape is still too risky
to allow direct contributions derived from AI output.  There is no moral
problem with AI itself, just the way that companies have implemented it
so far.  If you had an AI based on FLOSS sources, run on local hardware,
trained on known copyright-safe inputs, there would be no moral issue
with it.  Home assistant's Piper/Kaldi/HassIL modules are examples of
"moral AI".

> In some other project, a co-maintainer saw a bug report from an AI
> tool,

I hate those, especially when the submitter hasn't bothered to check the
AI's work.  However, AI *has* found some serious bugs (and sometimes
with correct patches) for us.  It needs to mature, but I think it is
already showing it's worth.

> Linters directly or indirectly influence the patch, even if they don't
> generate the patch verbatim.

Yes, but there's no technical solution for stupid.  A contributor who is
inexperienced enough to misuse AI is no different than a contributor who
is inexperienced enough to misuse emacs.  It's our job to help them
become better contributors.

> Because the world has survived without AI for so many years, I think
> it's safer to err on the side of not using it enough, compared to using
> it too much.

The same could be said of any technology, all the way back to the
invention of farming ("hunting and gathering is good enough for
everyone!")

I think the key today is to find out what it *is* good for, and what it
isn't, and try to help the community find AI's place in things.  In my
case, I find it very useful as an "idea generator".  I give it the
basics of a problem and see which rabbit holes it goes down that I
haven't considered yet.  It's also a much better search engine than the
search engines (I used it to find out about the groff_man man page).
However, I treat it like "a recent college grad with a degree in
Everything."  Knowledge but not wisdom, needs oversight.

In our specific case, I wouldn't want AI to write mission-critical
software, but it's a waste of my time to write yet another single-use
20-line perl script to look for patterns in man pages.  Plus, I didn't
ask the AI to give me the statistics, I asked it for the perl script.
It's short enough I can look at it and say "yup, that's what I would
have written", and then *I* run it to get the statistics.

(as an amusing aside, our company encourages us to use AI to automate
boring repetitive tasks.  So I had it do my quarterly self-review.  I
think it did a better job than I would have at making me look good...)

>> However, I won't not use AI to help me understand the problems I'm
>> trying to solve, or optimize any diagnosing I need to do.  My time is
>> too precious to be stupid on purpose.
>
> If the LLM makes you misunderstand something, and causes a false
> sense of understanding, your contribution might end up having lower
> quality than it would.

This is not an LLM problem.  EVERYTHING we use to help us solve problems
could lead to misunderstanding.  I *know* AI can be wrong, and I double
check it all the time.  Please give me some credit for my many decades
of not trusting technology ;-)

> But I care about the difference between the quality of a patch, and the
> quality perceived by the author, and my expectations of the contributor.

Then judge the patch, help the author/contributor improve, and not worry
about the hidden details.  You don't make the author use a specific
editor, or a particular brand of keyboard.  AI is just another tool.
Yes, we should not accept *unmoderated* AI contributions, but how a
human chooses to use the tools available to them is up to them, not us.

--------------------------------------------------
#!/usr/bin/perl
# -*- perl -*-

$MANPATH=$ENV{"MANPATH"};
$MANPATH=".:/usr/local/man";

if ($#ARGVV == 1) {
    $pattern = "^$ARGV[1]\\.$ARGV[0]" . "\\D*";
} else {
    $pattern = "^$ARGV[0]" . "\\.(\\d\\D*|[a-zA-Z]\$)";
}

# print "pattern is $pattern\n";

if ( -f $ARGV[0] ) {
    $page = $ARGV[0];
} else {
    # Find it, including one level of subdirectory.
  DIR:
    for $dir (split(':', $MANPATH)) {
	opendir(D, $dir);
	for $f (sort readdir(D)) {
	    next if $f =~ /^\./;
	    #print "try $dir/$f\n";
	    if ($f =~ m@$pattern@io) {
		$page = "$dir/$f";
		last DIR;
	    }
	    if ( -d "$dir/$f") {
		opendir(SD, "$dir/$f");
		for $sf (sort readdir(SD)) {
		    next if $sf =~ /^\./;
		    #print "try $dir/$f/$sf\n";
		    if ($sf =~ m@$pattern@io) {
			$page = "$dir/$f/$sf";
			last DIR;
		    }
		}
		closedir(SD);
	    }
	}
	closedir(D);
    }
}

unless ($page) {
    print "Not found!\n";
    exit 0;
}
# print "Found $page\n";
# exit 0;

# Get the terminal's width
$stty = `stty size 2>/dev/null`; 
($height, $width) = ($stty =~ m@(\d+)\s+(\d+)@);
$width = $width unless $width > 10;
$width -= 2;

# I prefer no hyphenation when I'm reviewing my changes
$hypenate = "";
#$hyphenate = "-rHY=0";

open(N, "groff -mandoc -Tutf8 -rLL=${width}n $hyphenate -rCR=1 -P-i $page |");
#open(M, "| less -R");
#select M;
while (<N>) {
    # Colorize certain formatting
    s/\033\[1m/\033\[1;32m/g;		# bold -> green
    s/\033\[3m/\033\[3;34m/g;		# italics -> blue
    s/^\033\[1;32m/\033\[1;31m/g;	# section headers are red

    s/\033\[21m/\033\[21;39m/g;		# ending style ends color too
    s/\033\[22m/\033\[22;39m/g;
    s/\033\[23m/\033\[23;39m/g;
    print;
}
close(N);
#close(M);



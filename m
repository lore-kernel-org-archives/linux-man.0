Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D7C3033DA
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874558; cv=none; b=m+EtProAp7qWDpzY/YAniQn1SMBN4+wQSZoHgbzguHmnEi0wUB6OYrIDDCpp0y5VUR6kKkcQOwSwp0id2MO3XtQrIvGt+A4TN9gMixgHjH99ixKryTa2m3V8Wm72Yi/Of0vOgFuKKpU5CvzlZUSOkxHThTpu38vz9DUSDMtAOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874558; c=relaxed/simple;
	bh=AW6s8ViPkdJ27Pw+UqBlWlZHhX8nKQ4CJgC34R8DUq8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3Bp5HWL4Z/y/9eKXEey5VWO9PfoNViK5dNo8bMNVRPe8wmgK62yjGur6WFudV03d2zlwJyLZlinwnyjHxoXsikw5wuWux+EXnn9vHvMmOZQFJ+klKf0/nj7jLSEGKNF1Gr9yWzDqs82h99TVxkwE/bnKNAvpIW9/Xs4AiIjUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeywNrO8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeywNrO8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so2673255e9.1
        for <linux-man@vger.kernel.org>; Tue, 04 Aug 2026 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874555; x=1786479355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW6s8ViPkdJ27Pw+UqBlWlZHhX8nKQ4CJgC34R8DUq8=;
        b=QeywNrO8wKNyDE+XXlHOc3HAMgx6NmOn7To4zA5YZa9FrhmuPwvxS6XsdLo7/36ZjF
         dVBjBnG0nTV2SOpp0bdWHMW7POMvImZIC80zppUS4g3cAPHaKwnLv8aV2GOZDijJaleB
         PRUwNWMcr5WKb3fn8zEZ6XBhqJ2cucvitvviWGOdZKqXlfq4sBJu/BMaG7e36NCgEbRT
         mfIvNkmR8O71H0Pu1YXla6JQ3xk7GU1KMopYh9rdV6QwmnHPQ4Pt+5mLPjU7BaGwPJnR
         1Yr2USs9K+yjOiCYN7Jo/oYcg7LanHD4KI5zQRh2aE4hZJgfojMwa6vifh0ITgX7j4l6
         uiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874555; x=1786479355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AW6s8ViPkdJ27Pw+UqBlWlZHhX8nKQ4CJgC34R8DUq8=;
        b=YGJKObW/Schm+bpbg9gli4FndLnAt/gzzj8Kbh7hfdQxryAZ5DGdhxYikJ0JqRgYSU
         NDEM/8xd8b/fAph+AOgLGub7rumq4F2YcSPpH1noDgdsqoLaT3pGQ/angyVE6NXFWGSJ
         6TdmbfUTAb8YhmIhU80gUG63efUVftBlR4g4peYvW09+cR8Q+SBhYBaQgfqJngHyvHg2
         fwN4/t5IHN0s8XipdJCVXp/3xg0ac8KXiOzFfcQHeWCH9qMpJSzKTAN3dLeAXaZeRXE/
         mZ6jcLk445B+XJYcqBG3zRxBPz/Kx1AIQs/BO4BLKFl8dtJBCDqoNTMA0brFjTClEh9g
         sBEA==
X-Forwarded-Encrypted: i=1; AHgh+RrQfcdiT4MciUeCVrrQ2uKkJtN9nJ+JgikIXbtJUb9kf6bC/s3freUS1BFayLkqBA+V3B4qhyyTJAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyrVRbyw/Zjuqv19PczyphG887mjkKrmwtfcYUYoyLE94+RBH
	9YAy5hNcLoh0HNIiovmOUgzWG98oF6nX6lfcn6pXAsLkAox+svncC2/aKnHOh+y4
X-Gm-Gg: AR+sD12+8pjdl3oGmhV6Ig4FnorOC15ga4P9p+gY4IpIgmPSuKfa84si9F5IWa8X+/Y
	6IYyHbT2+eY5uzCX9/4LBHjAQ3sKX3NQJs5OiWmLTI758AW8K5dP34cUMuC0Pe67b6K9ZqFbSKI
	tf5WqOpnzLrDeRmJQFRW48mCrhGI0to9Mq3WsAmGzZGjGpWGBKECsQKPBL93G/45G+Rlx73fypH
	lNXMUn5NQxnGdkOw/lzfdeCu/efQaGP6D+rSvCQLm6pUF1xds/mIbNgqcv48NIKAELzdTiv3EaA
	dhfbgyR40LWToqLnADQNDJjp2UerRhRtWOQFSiBPQfpQi72HRgvHVlm+FgdjNbRv+46lVG1gBeZ
	NEOmgLlAgwES06Fs4tTNRk/5alq+3PbqdVPFfHycZHVnOtKSpV4xcOjBPHhETAhXGDb5P5R3fwu
	wLPwqsmHfwRAgMdeaVGel2ZzaErDGuqIznwenSxBdNRBZz0e60A2QAtO6JP87RQsW+cbQ=
X-Received: by 2002:a05:600c:68c2:b0:495:648c:a1 with SMTP id 5b1f17b1804b1-49949fe6980mr107992735e9.3.1785874554858;
        Tue, 04 Aug 2026 13:15:54 -0700 (PDT)
Received: from localhost ([2a02:586:d80b:3fce:998f:a77:2a:cf12])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm2735878f8f.6.2026.08.04.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:15:54 -0700 (PDT)
From: "=?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?==?utf-8?B?z4I=?=" <aga.chatzimanikas@gmail.com>
X-Google-Original-From: =?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?=
	=?utf-8?B?z4I=?= <a.hatzim@gmail.com>
Date: Tue, 4 Aug 2026 23:14:23 +0300
To: Alejandro Colomar <alx@kernel.org>
Cc: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [GNULIB] The goal of the Linux man-pages project
Message-ID: <anJIHzkK68R5KAgH@CHATZ>
Mail-Followup-To: Alejandro Colomar <alx@kernel.org>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
References: <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
 <anIaZ8X_73ZjmYtR@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anIaZ8X_73ZjmYtR@devuan>

Hi all,

I think I might be repeating myself a bit, but i would like to express a
subjective conclusion but from a point of an objective observer, so i had to
repeat some bits.

But first, lets start that i'm feeling that we owe to Alejandro, and [t]his
email I'm ansering should be the proof.

Look. People around here i breath, are without second thought the kings of
selfishness.
They really like their a.h and they do their best to put it in comfort. But:

When they are involved on cases that there is no gain for them, they are and
without second thought the kings of justness. This brings the desired balance.
There is a poem, that became a song, and could easily be our national anthem
that says: "Sun of justice, whom we feel"

Now, let's go dive in deep, and keep it short :).

Is there anyone out there, that if we started afresh a libc and the standard,
who believes that mem*() belong to string.h header?

Look, there is this one special thing that can characterize a programmer, and
this is preciseness! Based on that, i really believe that every sane C programmer
in this planet, would be voting for a header like memory.h, because that is the
of their operation. End of story.

Again and to Alex mostly:
Judging from the current glorious! circumstances we live, to ask from old dogd
to make such trycks is unreasonable. This is not a fight that deserves to spend
our valuable energy. End of story. I believe you'll understand. Again, you are
tottally precise. And in my opinion, you can be accused for overheated enthusiasm
or overzealously, but with no way for irresponsibility (quite the contrary!),
and in my opinion you are deserving an apology.

But and to be precise, we all owe to Branden (I can't remember the last time
I met such a crystal logic, and it feels like a gift (thankfully this giant
(mostly useless) thread offered some value :))).

To others: please offer some trust to Alex. He proved (okey he is selfish like
every f atom in this world we know) that is capable to change mind and offer a
way out. But is ridicoulous to ask by him to bow in his knees and loose his
mind. Because it is clear that he believes that he is doing the right thing.
So again give him some space and trust. We all (always) need each other, but
especially those brilliant moments we live. Please don't give the machine the
chance to do even a bit more than it should do. It is obviously fatal if we
give it even a bit of space out of what we can control with confidence.

Many thanks for listening.

Received: from mail.schemamania.org (syn-050-075-019-234.biz.spectrum.com [50.75.19.234])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1934B3A0E8B
	for <linux-man@vger.kernel.org>; Fri, 17 Jul 2026 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.75.19.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326387; cv=none; b=H/XHxRVHoPMwEvK65iaghukRLT2I1U9WOQMJGIr6/7Uz/cONxmx9uoLgRyIJqLpPkfx0T74t7sRVDpgyrmfaq8xXzDdkxyFNI5+/5hnzzGcjVAGHnHj3EEP+4zberoOX49U6UVyXe5FVb/EeV7bLYKFPksUjHBWHAWk1ppgwOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326387; c=relaxed/simple;
	bh=mm3dU3rkVXqj7df7KWTDpbFa/oML10PbDRVXqoWx0/I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WdWilYZwql1IgKEuPpU0UXuk7AlCkXSuTOkQHi94VzaesQlp3lNXjq+vb42D2S6uZbbATPCzhG15JeXuD9d9PksWSOpsjVMIjbueq+sHScadmf3xa5tk6Rt+EAThcNxn6gi1f9wxWsRtgXcAlBMZs6iPam22XhLDMQft1HH4wKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schemamania.org; spf=pass smtp.mailfrom=schemamania.org; arc=none smtp.client-ip=50.75.19.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schemamania.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schemamania.org
Received: from oak.schemamania.org (localhost [IPv6:::1])
	by mail.schemamania.org (Postfix) with ESMTP id 76294256FADC;
	Fri, 17 Jul 2026 18:04:16 -0400 (EDT)
Date: Fri, 17 Jul 2026 18:04:16 -0400
From: "James K. Lowden" <jklowden@schemamania.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, Douglas McIlroy
 <douglas.mcilroy@dartmouth.edu>, linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-Id: <20260717180416.b2c1566518b1ec433e983e18@schemamania.org>
In-Reply-To: <20260717171509.4sdaukkhloy33lne@illithid>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
	<aljtsrJVLTN6qlxP@devuan>
	<CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
	<alobDcKZVkwVqzRx@devuan>
	<20260717171509.4sdaukkhloy33lne@illithid>
X-Mailer: Sylpheed 3.4.3 (GTK+ 2.24.28; x86_64--netbsd)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 12:15:09 -0500
"G. Branden Robinson" <g.branden.robinson@gmail.com> wrote:

> I wonder if James K. Lowden's proposed "man-intro" document might be
> worth a second look at this time.

Thanks for the vote of confidence, Branden.  :-)  

It so happens I was musing not long ago what might ever happen to that
page. In my memory, I reorganized it against my better judgement, and
then gave up when I was asked to make mechanical changes (such as but
not only starting every sentence on a new line).  

If it were up to me, we'd return to my original submission and use it.
From my pov it's better than nothing and the user suffers from our
inability to reach consensus on what is an acceptable starting point.
It would not be, as you well know, the only part of the documentation
that could stand improvement.  

I would only observe that lo this five years later the name of the
file, man-intro.1, places it in the wrong section.  I suppose
man-intro.7 is more appropriate.  

I am unable to participate in groff these days, my spirit having been
hijacked by gcc.  But you will perhaps be amused that your camel now
has its nose in their tent.  I showed GCC how to render mdoc pages as
PDF and HTML, and that became part of the distribution.  One of these
days I will follow through on my threat to use Ingo's mandoc library to
generate so-called railroad diagrams for COBOL syntax.  

Kind regards, 

--jkl

Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B96D4756D7
	for <linux-man@vger.kernel.org>; Fri, 14 Aug 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786721422; cv=none; b=HQpbHN5bK8kwUZNXlD9Fs2hDGSgOvHYhfyJDO6/k85Vu2kb+URFLYHtPT70cl4ONjLAfXH+xsvMPZ9iEneihkFN+1ccrKQ9ww4FhX1g58ZwkBLxupbpso90LcN+gQChKy+LkZLomNMDdymA3BItT1U1OE5kpN4tGd11/IaR/scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786721422; c=relaxed/simple;
	bh=544ar2Z0hs69zDEmjgAlcV2AbK9Fbx6802wbaV+aPjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NdSTrl+fn8R54IBJZxakztUQcXb9vd0wlrXHxVuscR9DQjH3TTUjs/O59mx4Xxgs554qfP06KwbUZuTwXeZGkaryszl6/gkLTmUektyI4mqKcpgeJZQtIl+JiqYZzoC8joVPcKXcCvBXiDYSMzMSB1AMXtEXMCVW/ry1AN12jhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2181592009C; Fri, 14 Aug 2026 17:30:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1C8FB92009B;
	Fri, 14 Aug 2026 16:30:17 +0100 (BST)
Date: Fri, 14 Aug 2026 16:30:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
cc: =?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>, 
    Alejandro Colomar <alx@kernel.org>, Collin Funk <collin.funk1@gmail.com>, 
    Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
    bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <20260802231058.o7gud4bd7co2nbhv@illithid>
Message-ID: <alpine.DEB.2.21.2608140556070.14132@angie.orcam.me.uk>
References: <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu> <am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me> <20260802231058.o7gud4bd7co2nbhv@illithid>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Aug 2026, G. Branden Robinson wrote:

> > The name of a header providing some function is thus inconsequential.
> 
> Then why not have one official big header file for the whole standard?
> 
> #include <stdlibc.h>

 That wouldn't be too unreasonable nowadays I suppose, not IMHO anyway.

 Back when memory was much more constrained in computers it made sense to
have declarations split across many files so as not to have to load and 
process lots of unnecessary data which could overflow the memory space 
available.  Beyond that the overall performance of contemporary machines 
is not to be underrated for the purpose of this consideration either.

 So yes, I think having one .h file per -l library would make sense now.

 FWIW,

  Maciej

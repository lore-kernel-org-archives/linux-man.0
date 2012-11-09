From: Anton Vorontsov <anton.vorontsov@linaro.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Fri, 9 Nov 2012 01:04:40 -0800
Message-ID: <20121109090440.GA20998@lizard>
References: <20121107105348.GA25549@lizard>
 <20121109093203.4358eaf2@doriath>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20121109093203.4358eaf2@doriath>
Sender: owner-linux-mm@kvack.org
To: Luiz Capitulino <lcapitulino@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>, Pekka Enberg <penberg@kernel.org>, Leonid Moiseichuk <leonid.moiseichuk@nokia.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, Minchan Kim <minchan@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, John Stultz <john.stultz@linaro.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, patches@linaro.org, kernel-team@android.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 09, 2012 at 09:32:03AM +0100, Luiz Capitulino wrote:
> Anton Vorontsov <anton.vorontsov@linaro.org> wrote:
> > This is the third RFC. As suggested by Minchan Kim, the API is much
> > simplified now (comparing to vmevent_fd):
> 
> Which tree is this against? I'd like to try this series, but it doesn't
> apply to Linus tree.

Thanks for trying!

The tree is a mix of Pekka's linux-vmevent tree and Linus' tree. You can
just clone my tree to get the whole thing:

	git://git.infradead.org/users/cbou/linux-vmevent.git

Note that the tree is rebasable. Also be sure to select CONFIG_VMPRESSURE,
not CONFIG_VMEVENT.

Thanks!
Anton.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

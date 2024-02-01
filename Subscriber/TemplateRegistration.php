<?php declare(strict_types=1);

namespace MagediaOrdertracker\Subscriber;

use Doctrine\Common\Collections\ArrayCollection;
use Enlight\Event\SubscriberInterface;
use Shopware\Components\Plugin\ConfigReader;

class TemplateRegistration implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginName;

    /**
     * @var string
     */
    private $pluginDirectory;

    /**
     * @var \Enlight_Template_Manager
     */
    private $templateManager;

    /**
     * @var ConfigReader
     */
    private $configReader;

    /**
     * @param string $pluginName
     * @param string $pluginDirectory
     * @param \Enlight_Template_Manager $templateManager
     * @param ConfigReader $configReader
     */
    public function __construct(
        $pluginName,
        $pluginDirectory,
        \Enlight_Template_Manager $templateManager,
        ConfigReader $configReader
    ) {
        $this->pluginName = $pluginName;
        $this->pluginDirectory = $pluginDirectory;
        $this->templateManager = $templateManager;
        $this->configReader = $configReader;
    }

    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PreDispatch' => 'onPreDispatch',
            'Theme_Compiler_Collect_Plugin_Javascript' => 'addJsFiles'
        ];
    }

    public function onPreDispatch()
    {
        $config = $this->configReader->getByPluginName($this->pluginName);

        $this->templateManager->assign('magediaOrdertrackerWidgetId', $config['magediaOrdertrackerWidgetId']);
        $this->templateManager->addTemplateDir($this->pluginDirectory . '/Resources/views');
    }

    /**
     * Provide the file collection for js files
     *
     * @return ArrayCollection
     */
    public function addJsFiles(): ArrayCollection
    {
        $jsFiles = [
            $this->pluginDirectory . '/Resources/views/frontend/_public/src/js/ordertracker.js',
        ];

        return new ArrayCollection($jsFiles);
    }
}
